### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 0b729cf8-56b1-49a8-aefa-24e77dbd5bf7
begin
	using Pkg
	Pkg.add("BenchmarkTools")
end

# ╔═╡ a3da45b0-1c8b-4173-b1b8-1f84b7be937f
begin
	Pkg.add("PyCall")
	using PyCall
end

# ╔═╡ f5a0d6bb-4d15-4d57-83a4-1031d16b3096
begin
	Pkg.add("Conda")
	using Conda
end

# ╔═╡ 639bb714-7b67-48d8-87e8-6bf249c48ae2
using BenchmarkTools

# ╔═╡ 74583190-d2b9-419a-84d3-dcb79da77a4e
begin
	using Libdl
	C_code = """
	#include <stddef.h>
	double c_sum(size_t n, double *X) {
	    double s = 0.0;
	    for (size_t i = 0; i < n; ++i) {
	        s += X[i];
	    }
	    return s;
	}
	"""

	const Clib = tempname()   # make a temporary file


	# compile to a shared library by piping C_code to gcc
	# (works only if you have gcc installed):

	open(`gcc -fPIC -O3 -msse3 -xc -shared -o $(Clib * "." * Libdl.dlext) -`, "w") do f
	    print(f, C_code) 
	end

	# define a Julia function that calls the C function:
	c_sum(X::Array{Float64}) = ccall(("c_sum", Clib), Float64, (Csize_t, Ptr{Float64}), length(X), X)
end

# ╔═╡ 1ddf751d-9c79-4841-8ebf-9e49adf46523
begin
	using Plots
	gr()
end

# ╔═╡ fb19cf22-1137-4457-a492-a21a2ddcfe05
md"""
# Julia is fast

Very often, benchmarks are used to compare languages.  These benchmarks can lead to long discussions, first as to exactly what is being benchmarked and secondly what explains the differences.  These simple questions can sometimes get more complicated than you at first might imagine.

The purpose of this notebook is for you to see a simple benchmark for yourself.  One can read the notebook and see what happened on the author's Macbook Pro with a 4-core Intel Core I7, or run the notebook yourself.

(This material began life as a wonderful lecture by Steven Johnson at MIT: https://github.com/stevengj/18S096/blob/master/lectures/lecture1/Boxes-and-registers.ipynb.)
"""

# ╔═╡ f7e66bb6-d94a-4c45-b914-acd4aa319ff5
md"""
# Outline of this notebook

- Define the sum function
- Implementations & benchmarking of sum in...
    - C (hand-written)
    - C (hand-written with -ffast-math)
    - python (built-in)
    - python (numpy)
    - python (hand-written)
    - Julia (built-in)
    - Julia (hand-written)
    - Julia (hand-written with SIMD)
- Summary of benchmarks
"""

# ╔═╡ edd423f6-18a3-461b-b20e-36f9086f4464
md"""
# `sum`: An easy enough function to understand
"""

# ╔═╡ a262e19b-f636-4806-9d56-7ddc0b1ba4e3
md"""
Consider the  **sum** function `sum(a)`, which computes
$$
\mathrm{sum}(a) = \sum_{i=1}^n a_i,
$$
where $n$ is the length of `a`.
"""

# ╔═╡ 31e403bf-84c4-4bd9-b8ec-a0e9f085f332
a = rand(10^7) # 1D vector of random numbers, uniform on [0,1)

# ╔═╡ deefb0d5-2b93-4114-a466-b8c316df3f8d
sum(a)

# ╔═╡ 5f562223-50d8-4b8f-963d-ba9863836a2a
md"""
The expected result is 0.5 * 10^7, since the mean of each entry is 0.5
"""

# ╔═╡ 7855811d-ee36-408e-aca8-3b40a3977190
md"""
# Benchmarking a few ways in a few languages
"""

# ╔═╡ 01b1ca2b-3807-4618-a42f-d741f807787b
@time sum(a)

# ╔═╡ 48a14b82-6062-45b9-b627-7fb6cd3697fb
@time sum(a)

# ╔═╡ 0059a697-82be-4dfd-ba37-d7a8fd8c8d3d
@time sum(a)

# ╔═╡ fbb25ab1-7e1e-4789-bb49-98f6a45c9291
md"""
The `@time` macro can yield noisy results, so it's not our best choice for benchmarking!

Luckily, Julia has a `BenchmarkTools.jl` package to make benchmarking easy and accurate:
"""

# ╔═╡ e35eb608-c200-4d61-a5b7-d87935218a98
md"""
#  1. The C language

C is often considered the gold standard: difficult on the human, nice for the machine. Getting within a factor of 2 of C is often satisfying. Nonetheless, even within C, there are many kinds of optimizations possible that a naive C writer may or may not get the advantage of.

The current author does not speak C, so he does not read the cell below, but is happy to know that you can put C code in a Julia session, compile it, and run it. Note that the `\"\"\"` wrap a multi-line string.
"""

# ╔═╡ 6560875a-d673-4b5e-86a1-c6dcff93fa36
c_sum(a)

# ╔═╡ f81de1f4-73f3-4143-b2eb-82ec4eafc021
c_sum(a) ≈ sum(a) # type \approx and then <TAB> to get the ≈ symbolb

# ╔═╡ 2818bc5c-d257-4804-8451-020ac7c611dc
c_sum(a) - sum(a)  

# ╔═╡ 2ffb2502-639a-4f0a-bcf0-2f130b5a782b
≈  # alias for the `isapprox` function

# ╔═╡ 29b33eaf-37e7-40ff-8a65-3b77bb7fd366
?isapprox

# ╔═╡ 451175c4-ade3-4b4d-972c-ef49460f9397
md"""
We can now benchmark the C code directly from Julia:
"""

# ╔═╡ 5faa5584-b229-4d81-9e51-e06925908a43
c_bench = @benchmark c_sum($a)

# ╔═╡ 9b0c22ac-cd18-4e9e-9da7-73c7668f0b70
begin
	using Statistics # bring in statistical support for standard deviations
	t = c_bench.times / 1e6 # times in milliseconds
	m, σ = minimum(t), std(t)

	histogram(t, bins=500,
	    xlim=(m - 0.01, m + σ),
	    xlabel="milliseconds", ylabel="count", label="")
end

# ╔═╡ 686bc0e3-0a70-483b-a488-61bcda0dc45d
println("C: Fastest time was $(minimum(c_bench.times) / 1e6) msec")

# ╔═╡ 82afa332-2bfd-45c4-bdcb-203e0cc1b550
begin
	d = Dict()  # a "dictionary", i.e. an associative array
	d["C"] = minimum(c_bench.times) / 1e6  # in milliseconds
	d
end

# ╔═╡ b68f4648-c6cd-4c8a-87f8-6435285ab5bc
md"""
# 2. C with -ffast-math

If we allow C to re-arrange the floating point operations, then it'll vectorize with SIMD (single instruction, multiple data) instructions.
"""

# ╔═╡ 974e0dd1-7464-4601-a2a7-9ae733f16205
begin
	const Clib_fastmath = tempname()   # make a temporary file

	# The same as above but with a -ffast-math flag added
	open(`gcc -fPIC -O3 -msse3 -xc -shared -ffast-math -o $(Clib_fastmath * "." * Libdl.dlext) -`, "w") do f
	    print(f, C_code) 
	end

	# define a Julia function that calls the C function:
	c_sum_fastmath(X::Array{Float64}) = ccall(("c_sum", Clib_fastmath), Float64, (Csize_t, Ptr{Float64}), length(X), X)
end

# ╔═╡ 20e16b0f-59bd-483e-bbb2-e65fe2e5db9b
c_fastmath_bench = @benchmark $c_sum_fastmath($a)

# ╔═╡ d95a4c86-2d4f-4d6f-9823-969899ee51a2
d["C -ffast-math"] = minimum(c_fastmath_bench.times) / 1e6  # in milliseconds

# ╔═╡ b312b836-55a1-41fe-b746-1adca739080e
md"""
# 3. Python's built in `sum` 
"""

# ╔═╡ f35f3782-34dd-4187-901d-3835772cf3f6
md"""
The `PyCall` package provides a Julia interface to Python:
"""

# ╔═╡ 3bfbc9cb-16d6-4815-b384-78da8ca7b64a
# get the Python built-in "sum" function:
pysum = pybuiltin("sum")

# ╔═╡ a1a39db8-0582-4ff8-a59c-9e80ddd20fc0
pysum(a)

# ╔═╡ b883d7c4-2fb8-44f8-8f10-42e2c13b7f2a
pysum(a) ≈ sum(a)

# ╔═╡ ecf2e751-2cd9-46c1-8103-679009947838
py_list_bench = @benchmark $pysum($a)

# ╔═╡ adaeb54f-664c-459b-b3ca-e7a36d2b9aaa
begin
	d["Python built-in"] = minimum(py_list_bench.times) / 1e6
	d
end

# ╔═╡ b621f994-9c4b-490a-a611-60354e95aa0a
md"""
# 4. Python: `numpy` 

## Takes advantage of hardware "SIMD", but only works when it works.

`numpy` is an optimized C library, callable from Python.
It may be installed within Julia as follows:
"""

# ╔═╡ f9caedb8-be70-43b7-8595-2a867aa64974
Conda.add("numpy")

# ╔═╡ 5aa2709f-ab30-406c-90ad-79c3e3a8d595
begin
	numpy_sum = pyimport("numpy")["sum"]

	py_numpy_bench = @benchmark $numpy_sum($a)
end

# ╔═╡ 28211438-4fca-4886-9b00-fce76a0ec5b5
numpy_sum(a)

# ╔═╡ c74f7b45-e08a-4640-b181-704d58a14b01
numpy_sum(a) ≈ sum(a)

# ╔═╡ ffbbdcca-a075-40b4-b88c-8b7afb24acc1
begin
	d["Python numpy"] = minimum(py_numpy_bench.times) / 1e6
	d
end

# ╔═╡ 22a2eaf3-2638-4d1f-bdfc-403815401c14
md"""
# 5. Python, hand-written 
"""

# ╔═╡ e2b702f8-9885-41e5-afb5-89c9939f505d
begin
	py"""
	def py_sum(A):
	    s = 0.0
	    for a in A:
	        s += a
	    return s
	"""

	sum_py = py"py_sum"
end

# ╔═╡ 791ba15a-f599-45ec-b68f-a0a9d0a51764
py_hand = @benchmark $sum_py($a)

# ╔═╡ 20d7026d-5580-4427-b942-5a5e3bd22775
sum_py(a)

# ╔═╡ 24290f20-3a39-4cb6-9978-b1de1d543ecc
sum_py(a) ≈ sum(a)

# ╔═╡ 2b38aea3-35b0-4698-92fd-ac1972ae0199
begin
	d["Python hand-written"] = minimum(py_hand.times) / 1e6
	d
end

# ╔═╡ 84262871-674d-4b67-9f80-5ac70909e860
md"""
# 6. Julia (built-in) 

## Written directly in Julia, not in C!
"""

# ╔═╡ 9f7c8999-bc10-45bb-8c21-6c9ff3011c71
@which sum(a)

# ╔═╡ 02bced96-dad2-4b31-a901-7f730840d367
j_bench = @benchmark sum($a)

# ╔═╡ 9f86d4a3-4653-42bd-8f0b-3948a24e2703
begin
	d["Julia built-in"] = minimum(j_bench.times) / 1e6
	d
end

# ╔═╡ e9d30762-466c-49a0-97ed-dd9096ad52f6
md"""
# 7. Julia (hand-written) 
"""

# ╔═╡ d3089058-9db3-42fc-a5d8-32b62ae986a1
begin
	function mysum(A)   
	    s = 0.0 # s = zero(eltype(a))
	    for a in A
	        s += a
	    end
	    s
	end
end

# ╔═╡ dfbaa9f2-0c26-4b78-b416-50efa82e4105
j_bench_hand = @benchmark mysum($a)

# ╔═╡ 79e5a18e-e781-496c-bc92-d8d25d48d757
begin
	d["Julia hand-written"] = minimum(j_bench_hand.times) / 1e6
	d
end

# ╔═╡ d44e9a3d-519b-412a-916f-df7b79a3a700
md"""
# 8. Julia (hand-written w. simd) 
"""

# ╔═╡ 3e387824-031a-4614-a75a-57f9f6b82646
begin
	function mysum_simd(A)   
	    s = 0.0 # s = zero(eltype(A))
	    @simd for a in A
	        s += a
	    end
	    s
	end
end

# ╔═╡ 609a1945-827b-4f23-9056-23b3d31e4559
j_bench_hand_simd = @benchmark mysum_simd($a)

# ╔═╡ c845645e-c0a9-4621-9ec5-17e90fbb5b4e
mysum_simd(a)

# ╔═╡ b5cfc3c0-13ae-4f23-828f-99c94b9a332c
begin
	d["Julia hand-written simd"] = minimum(j_bench_hand_simd.times) / 1e6
	d
end

# ╔═╡ b2e0e64f-416a-4331-b2d0-a0f872538bc4
md"""
# Summary
"""

# ╔═╡ a001f989-ae30-48ce-807c-d67833f7dbc6
begin
	for (key, value) in sort(collect(d), by=last)
	    println(rpad(key, 25, "."), lpad(round(value; digits=1), 6, "."))
	end
end

# ╔═╡ Cell order:
# ╠═fb19cf22-1137-4457-a492-a21a2ddcfe05
# ╠═f7e66bb6-d94a-4c45-b914-acd4aa319ff5
# ╠═edd423f6-18a3-461b-b20e-36f9086f4464
# ╠═a262e19b-f636-4806-9d56-7ddc0b1ba4e3
# ╠═31e403bf-84c4-4bd9-b8ec-a0e9f085f332
# ╠═deefb0d5-2b93-4114-a466-b8c316df3f8d
# ╠═5f562223-50d8-4b8f-963d-ba9863836a2a
# ╠═7855811d-ee36-408e-aca8-3b40a3977190
# ╠═01b1ca2b-3807-4618-a42f-d741f807787b
# ╠═48a14b82-6062-45b9-b627-7fb6cd3697fb
# ╠═0059a697-82be-4dfd-ba37-d7a8fd8c8d3d
# ╠═fbb25ab1-7e1e-4789-bb49-98f6a45c9291
# ╠═0b729cf8-56b1-49a8-aefa-24e77dbd5bf7
# ╠═639bb714-7b67-48d8-87e8-6bf249c48ae2
# ╠═e35eb608-c200-4d61-a5b7-d87935218a98
# ╠═74583190-d2b9-419a-84d3-dcb79da77a4e
# ╠═6560875a-d673-4b5e-86a1-c6dcff93fa36
# ╠═f81de1f4-73f3-4143-b2eb-82ec4eafc021
# ╠═2818bc5c-d257-4804-8451-020ac7c611dc
# ╠═2ffb2502-639a-4f0a-bcf0-2f130b5a782b
# ╠═29b33eaf-37e7-40ff-8a65-3b77bb7fd366
# ╠═451175c4-ade3-4b4d-972c-ef49460f9397
# ╠═5faa5584-b229-4d81-9e51-e06925908a43
# ╠═686bc0e3-0a70-483b-a488-61bcda0dc45d
# ╠═82afa332-2bfd-45c4-bdcb-203e0cc1b550
# ╠═1ddf751d-9c79-4841-8ebf-9e49adf46523
# ╠═9b0c22ac-cd18-4e9e-9da7-73c7668f0b70
# ╠═b68f4648-c6cd-4c8a-87f8-6435285ab5bc
# ╠═974e0dd1-7464-4601-a2a7-9ae733f16205
# ╠═20e16b0f-59bd-483e-bbb2-e65fe2e5db9b
# ╠═d95a4c86-2d4f-4d6f-9823-969899ee51a2
# ╠═b312b836-55a1-41fe-b746-1adca739080e
# ╠═f35f3782-34dd-4187-901d-3835772cf3f6
# ╠═a3da45b0-1c8b-4173-b1b8-1f84b7be937f
# ╠═3bfbc9cb-16d6-4815-b384-78da8ca7b64a
# ╠═a1a39db8-0582-4ff8-a59c-9e80ddd20fc0
# ╠═b883d7c4-2fb8-44f8-8f10-42e2c13b7f2a
# ╠═ecf2e751-2cd9-46c1-8103-679009947838
# ╠═adaeb54f-664c-459b-b3ca-e7a36d2b9aaa
# ╠═b621f994-9c4b-490a-a611-60354e95aa0a
# ╠═f5a0d6bb-4d15-4d57-83a4-1031d16b3096
# ╠═f9caedb8-be70-43b7-8595-2a867aa64974
# ╠═5aa2709f-ab30-406c-90ad-79c3e3a8d595
# ╠═28211438-4fca-4886-9b00-fce76a0ec5b5
# ╠═c74f7b45-e08a-4640-b181-704d58a14b01
# ╠═ffbbdcca-a075-40b4-b88c-8b7afb24acc1
# ╠═22a2eaf3-2638-4d1f-bdfc-403815401c14
# ╠═e2b702f8-9885-41e5-afb5-89c9939f505d
# ╠═791ba15a-f599-45ec-b68f-a0a9d0a51764
# ╠═20d7026d-5580-4427-b942-5a5e3bd22775
# ╠═24290f20-3a39-4cb6-9978-b1de1d543ecc
# ╠═2b38aea3-35b0-4698-92fd-ac1972ae0199
# ╠═84262871-674d-4b67-9f80-5ac70909e860
# ╠═9f7c8999-bc10-45bb-8c21-6c9ff3011c71
# ╠═02bced96-dad2-4b31-a901-7f730840d367
# ╠═9f86d4a3-4653-42bd-8f0b-3948a24e2703
# ╠═e9d30762-466c-49a0-97ed-dd9096ad52f6
# ╠═d3089058-9db3-42fc-a5d8-32b62ae986a1
# ╠═dfbaa9f2-0c26-4b78-b416-50efa82e4105
# ╠═79e5a18e-e781-496c-bc92-d8d25d48d757
# ╠═d44e9a3d-519b-412a-916f-df7b79a3a700
# ╠═3e387824-031a-4614-a75a-57f9f6b82646
# ╠═609a1945-827b-4f23-9056-23b3d31e4559
# ╠═c845645e-c0a9-4621-9ec5-17e90fbb5b4e
# ╠═b5cfc3c0-13ae-4f23-828f-99c94b9a332c
# ╠═b2e0e64f-416a-4331-b2d0-a0f872538bc4
# ╠═a001f989-ae30-48ce-807c-d67833f7dbc6
