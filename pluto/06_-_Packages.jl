### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 48ff9402-0a39-42d7-bae0-a0b57c429ae1
begin
	using Pkg
	Pkg.add("Example")
end

# ╔═╡ d3bc2ae3-42f5-4c97-99ee-c4b39b65383f
Pkg.add("Colors")

# ╔═╡ f8c8ac20-5f71-420c-aaf1-bfe4c86b1bd1
using Example

# ╔═╡ 8acbc206-6515-488a-a11d-39e5afa4d504
using Colors

# ╔═╡ ab77f165-69ea-461d-827d-15646ae86ca5
md"""
# Packages

Julia has over 2000 registered packages, making packages a huge part of the Julia ecosystem.

Even so, the package ecosystem still has some growing to do. Notably, we have first class function calls  to other languages, providing excellent foreign function interfaces. We can easily call into python or R, for example, with `PyCall` or `Rcall`.

This means that you don't have to wait until the Julia ecosystem is fully mature, and that moving to Julia doesn't mean you have to give up your favorite package/library from another language! 

To see all available packages, check out

https://julialang.org/packages/

For now, let's learn how to use a package.
"""

# ╔═╡ 03a01ea9-0e96-464b-b8a9-d9f7343f9548
md"""
The first time you use a package on a given Julia installation, you need to use the package manager to explicitly add it:
"""

# ╔═╡ 01587bfb-0313-4f9e-8b49-b13e389d8587
md"""
Every time you use Julia (start a new session at the REPL, or open a notebook for the first time, for example), you load the package with the `using` keyword
"""

# ╔═╡ 504f917a-ac7a-49b3-adcd-c973ae3c87a3
md"""
In the source code of `Example.jl` at
https://github.com/JuliaLang/Example.jl/blob/master/src/Example.jl
we see the following function declared

```
hello(who::String) = "Hello, $who"
```

Having loaded `Example`, we should now be able to call `hello`
"""

# ╔═╡ b7e02839-1ccd-4a67-b7e4-814c7d6ccc5b
hello("it's me. I was wondering if after all these years you'd like to meet.")

# ╔═╡ 6ed2b34d-eb64-49ff-87c8-9e79f0a7c0aa
md"""
Now let's play with the Colors package
"""

# ╔═╡ 5c68324a-9d72-47c2-a0ae-4d7c8f475ec8
md"""
Let's create a palette of 100 different colors
"""

# ╔═╡ 1f9b5839-1b2b-4c70-81b7-be027d8ac116
palette = distinguishable_colors(100)

# ╔═╡ 5fdbbad9-5ba7-4a5f-98e0-a85f23908bcb
md"""
and then we can create a randomly checkered matrix using the `rand` command
"""

# ╔═╡ d650d313-c2cb-465e-9e9c-ad396c895d72
rand(palette, 3, 3)

# ╔═╡ 022fd48a-1ef5-41c6-baa1-5274332773a1
md"""
In the next notebook, we'll use a new package to plot datasets.
"""

# ╔═╡ 7f8d4c99-aa6a-4dcd-895e-a6d1eccf8a00
md"""
### Exercises

#### 7.1 
Load the Primes package (source code at https://github.com/JuliaMath/Primes.jl ).
"""

# ╔═╡ 0fe6bce2-2c83-4a50-bee8-18b91c829eff
@assert @isdefined Primes

# ╔═╡ fe977506-fc59-486b-9738-e82d0bfecc23
md"""
#### 7.2 
Verify that you can now use the function `primes` to grab all prime numbers under 1,000,000 and store it in variable `primes_list`
"""

# ╔═╡ c5884342-3f11-49f1-8984-c638b9ecd9ff
@assert primes_list == primes(1000000)

# ╔═╡ Cell order:
# ╠═ab77f165-69ea-461d-827d-15646ae86ca5
# ╠═03a01ea9-0e96-464b-b8a9-d9f7343f9548
# ╠═48ff9402-0a39-42d7-bae0-a0b57c429ae1
# ╠═01587bfb-0313-4f9e-8b49-b13e389d8587
# ╠═f8c8ac20-5f71-420c-aaf1-bfe4c86b1bd1
# ╠═504f917a-ac7a-49b3-adcd-c973ae3c87a3
# ╠═b7e02839-1ccd-4a67-b7e4-814c7d6ccc5b
# ╠═6ed2b34d-eb64-49ff-87c8-9e79f0a7c0aa
# ╠═d3bc2ae3-42f5-4c97-99ee-c4b39b65383f
# ╠═8acbc206-6515-488a-a11d-39e5afa4d504
# ╠═5c68324a-9d72-47c2-a0ae-4d7c8f475ec8
# ╠═1f9b5839-1b2b-4c70-81b7-be027d8ac116
# ╠═5fdbbad9-5ba7-4a5f-98e0-a85f23908bcb
# ╠═d650d313-c2cb-465e-9e9c-ad396c895d72
# ╠═022fd48a-1ef5-41c6-baa1-5274332773a1
# ╠═7f8d4c99-aa6a-4dcd-895e-a6d1eccf8a00
# ╠═0fe6bce2-2c83-4a50-bee8-18b91c829eff
# ╠═fe977506-fc59-486b-9738-e82d0bfecc23
# ╠═c5884342-3f11-49f1-8984-c638b9ecd9ff
