### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 4975ed76-9bd2-45be-a0c0-103df83fc1fa
md"""
# Functions

Topics:
1. How to declare a function
2. Duck-typing in Julia
3. Mutating vs. non-mutating functions
4. Some higher order functions
"""

# ╔═╡ 9c3b161b-8d6f-4f3c-af17-e61817159d91
md"""
## How to declare a function
Julia gives us a few different ways to write a function. The first requires the `function` and `end` keywords
"""

# ╔═╡ 6b18b762-1463-47c3-b528-edce65fccad9
begin
	function sayhi(name)
	    println("Hi $name, it's great to see you!")
	end
end

# ╔═╡ c9f99f45-ed3e-49d6-a3da-5d3587cdd05e
begin
	function f(x)
	    x^2
	end
end

# ╔═╡ 64eec8e5-7425-42a3-84ae-80937f0316f1
md"""
We can call either of these functions like this:
"""

# ╔═╡ 0aca25a0-2bc5-4d7f-b984-8fd85dd33747
sayhi("C-3PO")

# ╔═╡ 1777277b-dc22-427b-83c0-266e285ddae9
f(42)

# ╔═╡ 100304da-59fc-43af-a1a1-99fc345fdd71
md"""
Alternatively, we could have declared either of these functions in a single line
"""

# ╔═╡ d5909ffc-bf44-4b41-9e9a-c2a07494517d
sayhi2(name) = println("Hi $name, it's great to see you!")

# ╔═╡ 81ad2225-dccd-4e4d-b597-e640c5287a75
f2(x) = x^2

# ╔═╡ 5c97967e-451b-4573-a6a2-93e795c12a77
sayhi2("R2D2")

# ╔═╡ b430c6e5-8a28-4e54-b23d-fe371b9d148d
f2(42)

# ╔═╡ 22db8821-3b05-4253-9323-d46b97d46f35
md"""
Finally, we could have declared these as "anonymous" functions
"""

# ╔═╡ 8fa0e2df-87e8-4c2b-b41a-e4b71f80522f
sayhi3 = name -> println("Hi $name, it's great to see you!")

# ╔═╡ c9e342b9-ffb6-46fe-a207-6a6b66e12b91
f3 = x -> x^2

# ╔═╡ af3bf5df-ae42-454e-aadb-62fda11695d7
sayhi3("Chewbacca")

# ╔═╡ 3e0197fc-6d44-421d-96da-80cb3862b2d2
f3(42)

# ╔═╡ 72aadced-3670-4ee9-a26f-de65fe7a625e
md"""
## Duck-typing in Julia
*"If it quacks like a duck, it's a duck."* <br><br>
Julia functions will just work on whatever inputs make sense. <br><br>
For example, `sayhi` works on the name of this minor tv character, written as an integer...
"""

# ╔═╡ b5e1b2fa-3266-4260-ab74-97d6dd2c8ff8
sayhi(55595472)

# ╔═╡ 6aed7f68-4596-4755-9e83-2629e7a9e8a3
md"""
And `f` will work on a matrix. 
"""

# ╔═╡ ea802ce5-714c-42a1-b097-9852eac136e5
begin
	A = rand(3, 3)
	A
end

# ╔═╡ 59183399-0f1b-4d8a-a53b-16f5238db626
f(A)

# ╔═╡ e452745d-b21b-42bd-bdb8-910c601594d1
md"""
`f` will also work on a string like "hi" because `*` is defined for string inputs as string concatenation.
"""

# ╔═╡ f8d2e47f-be27-4e66-af5f-c11add17fb2a
f("hi")

# ╔═╡ d9186ee8-310b-4f33-9dfb-ac1f9497e7bf
md"""
On the other hand, `f` will not work on a vector. Unlike `A^2`, which is well-defined, the meaning of `v^2` for a vector, `v`, is not a well-defined algebraic operation. 
"""

# ╔═╡ ce87685e-7a44-484c-9a9c-1414346497f3
v = rand(3)

# ╔═╡ f0847d68-a4d8-4f18-b18a-0d0d5b843eba
# This won't work
f(v)

# ╔═╡ 40cb1b84-6492-4502-8ad4-c7d57541e14d
md"""
## Mutating vs. non-mutating functions

By convention, functions followed by `!` alter their contents and functions lacking `!` do not.

For example, let's look at the difference between `sort` and `sort!`.

"""

# ╔═╡ de5125fc-0cc7-47f1-b568-3e9493050d8e
v_2 = [3, 5, 2]

# ╔═╡ fba0bad9-ef3d-47ca-a0b3-219c9c2845d9
sort(v_2)

# ╔═╡ e5d3fbb8-69cc-4e2d-8428-ad81e8cd9060
v_2

# ╔═╡ 1d38ede9-dc38-40ce-9801-2fc195542887
md"""
`sort(v)` returns a sorted array that contains the same elements as `v`, but `v` is left unchanged. <br><br>

On the other hand, when we run `sort!(v)`, the contents of v are sorted within the array `v`.
"""

# ╔═╡ c76785e3-e760-4d3c-b962-7c173022384d
sort!(v_2)

# ╔═╡ 33e853f3-958f-426f-a01a-799d33f44c1d
v_2

# ╔═╡ a8df2b89-0beb-4916-9beb-3ff5c1dd8de3
md"""
## Some higher order functions

### map

`map` is a "higher-order" function in Julia that *takes a function* as one of its input arguments. 
`map` then applies that function to every element of the data structure you pass it. For example, executing

```julia
map(f, [1, 2, 3])
```
will give you an output array where the function `f` has been applied to all elements of `[1, 2, 3]`
```julia
[f(1), f(2), f(3)]
```
"""

# ╔═╡ 2565c6a2-d613-4b55-91ec-58674b2a9454
map(f, [1, 2, 3])

# ╔═╡ 6c5c0241-6a3d-4136-9c22-bcaff1e5740f
md"""
Here we've squared all the elements of the vector `[1, 2, 3]`, rather than squaring the vector `[1, 2, 3]`.

To do this, we could have passed to `map` an anonymous function rather than a named function, such as
"""

# ╔═╡ 190f2c04-acf5-4eff-8755-fe51e63b27b6
x -> x^3

# ╔═╡ 01b70c8d-8ddc-41e9-a29b-07294a655b76
md"""
via
"""

# ╔═╡ 8b5786c4-8402-4a97-bdca-6854d24b5612
map(x -> x^3, [1, 2, 3])

# ╔═╡ 2d3aa3b3-c1d1-4128-bca8-f8b131412791
md"""
and now we've cubed all the elements of `[1, 2, 3]`!
"""

# ╔═╡ 4babcfbc-2094-4402-b79a-1f6f0e84d63f
md"""
### broadcast

`broadcast` is another higher-order function like `map`. `broadcast` is a generalization of `map`, so it can do every thing `map` can do and more. The syntax for calling `broadcast` is the same as for calling `map`
"""

# ╔═╡ c12c27f7-e929-45ab-86b6-542ca9506cdf
broadcast(f, [1, 2, 3])

# ╔═╡ 8aefd2b3-1744-4b0d-bf38-1c27390d7a14
md"""
and again, we've applied `f` (squared) to all the elements of `[1, 2, 3]` - this time by "broadcasting" `f`!

Some syntactic sugar for calling `broadcast` is to place a `.` between the name of the function you want to `broadcast` and its input arguments. For example,

```julia
broadcast(f, [1, 2, 3])
```
is the same as
```julia
f.([1, 2, 3])
```
"""

# ╔═╡ b7262978-acff-42cd-878b-a3fa6427a732
f.([1, 2, 3])

# ╔═╡ ff1349dd-46e6-4335-85e4-24e165c4afe7
md"""
Notice again how different this is from calling 
```julia
f([1, 2, 3])
```
We can square every element of a vector, but we can't square a vector!
"""

# ╔═╡ 9f95d8bb-e0d3-45cd-9219-9281c621e3f2
md"""
To drive home the point, let's look at the difference between

```julia
f(A)
```
and
```julia
f.(A)
```
for a matrix `A`:
"""

# ╔═╡ edb0887d-54a3-45ba-a3ca-95569c7b6b55
A_2 = [i + 3*j for j in 0:2, i in 1:3]

# ╔═╡ 866fe0e8-e30d-4b75-92bc-3ca15832cbab
f(A_2)

# ╔═╡ d6cea940-6e77-4b8e-bd73-f718a9e50e3c
md"""
As before we see that for a matrix, `A`,
```
f(A) = A^2 = A * A
``` 

On the other hand,
"""

# ╔═╡ f57ad76f-2d28-4c09-8a5f-7c5c38e2cc0c
B = f.(A_2)

# ╔═╡ 80761690-7b40-4866-ad39-bdfe10f09655
md"""
contains the squares of all the entries of `A`.

This dot syntax for broadcasting allows us to write relatively complex compound elementwise expressions in a way that looks natural/closer to mathematical notation. For example, we can write
"""

# ╔═╡ ddef8c59-cde1-4c6c-af92-0b45214161bf
A_2 .+ 2 .* f.(A_2) ./ A_2

# ╔═╡ 575852fa-94d8-4f2b-aeba-28d5c07a1104
md"""
instead of
"""

# ╔═╡ 03e6c027-f886-47d5-a864-c69435b8cde4
broadcast(x -> x + 2 * f(x) / x, A_2)

# ╔═╡ 9e865400-e4a5-4ac9-aa3c-61c3646056b7
md"""
and the two will perform exactly the same.
"""

# ╔═╡ 0e7721b5-a785-465f-971d-393a37508b91
md"""
### Exercises

#### 6.1 
Write a function `add_one` that adds 1 to its input.
"""

# ╔═╡ bad7a8cc-5f6d-4ce3-9388-bd1d5bc8168e
@assert add_one(1) == 2

# ╔═╡ 480e27fb-0a18-4b30-af81-6fbd44e9ce58
@assert add_one(11) == 12

# ╔═╡ dd1ec5ca-bc9c-40a0-89f6-404c82822d66
md"""
#### 6.2 
Use `map` or `broadcast` to increment every element of matrix `A` by `1` and assign it to a variable `A1`.
"""

# ╔═╡ 6acb4a47-640c-474c-8999-c611e2b81eb9
@assert A1 == [2 3 4; 5 6 7; 8 9 10]

# ╔═╡ 6b0d8011-42fe-49dc-892c-61f8c153a671
md"""
#### 6.3 
Use the broadcast dot syntax to increment every element of matrix `A1` by `1` and store it in variable `A2`
"""

# ╔═╡ 2d7327a4-bc1f-4c20-af6c-e3116c79921e
@assert A2 == [3 4 5; 6 7 8; 9 10 11]

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.6"
manifest_format = "2.0"
project_hash = "71853c6197a6a7f222db0f1978c7cb232b87c5ee"

[deps]
"""

# ╔═╡ Cell order:
# ╠═4975ed76-9bd2-45be-a0c0-103df83fc1fa
# ╠═9c3b161b-8d6f-4f3c-af17-e61817159d91
# ╠═6b18b762-1463-47c3-b528-edce65fccad9
# ╠═c9f99f45-ed3e-49d6-a3da-5d3587cdd05e
# ╠═64eec8e5-7425-42a3-84ae-80937f0316f1
# ╠═0aca25a0-2bc5-4d7f-b984-8fd85dd33747
# ╠═1777277b-dc22-427b-83c0-266e285ddae9
# ╠═100304da-59fc-43af-a1a1-99fc345fdd71
# ╠═d5909ffc-bf44-4b41-9e9a-c2a07494517d
# ╠═81ad2225-dccd-4e4d-b597-e640c5287a75
# ╠═5c97967e-451b-4573-a6a2-93e795c12a77
# ╠═b430c6e5-8a28-4e54-b23d-fe371b9d148d
# ╠═22db8821-3b05-4253-9323-d46b97d46f35
# ╠═8fa0e2df-87e8-4c2b-b41a-e4b71f80522f
# ╠═c9e342b9-ffb6-46fe-a207-6a6b66e12b91
# ╠═af3bf5df-ae42-454e-aadb-62fda11695d7
# ╠═3e0197fc-6d44-421d-96da-80cb3862b2d2
# ╠═72aadced-3670-4ee9-a26f-de65fe7a625e
# ╠═b5e1b2fa-3266-4260-ab74-97d6dd2c8ff8
# ╠═6aed7f68-4596-4755-9e83-2629e7a9e8a3
# ╠═ea802ce5-714c-42a1-b097-9852eac136e5
# ╠═59183399-0f1b-4d8a-a53b-16f5238db626
# ╠═e452745d-b21b-42bd-bdb8-910c601594d1
# ╠═f8d2e47f-be27-4e66-af5f-c11add17fb2a
# ╠═d9186ee8-310b-4f33-9dfb-ac1f9497e7bf
# ╠═ce87685e-7a44-484c-9a9c-1414346497f3
# ╠═f0847d68-a4d8-4f18-b18a-0d0d5b843eba
# ╠═40cb1b84-6492-4502-8ad4-c7d57541e14d
# ╠═de5125fc-0cc7-47f1-b568-3e9493050d8e
# ╠═fba0bad9-ef3d-47ca-a0b3-219c9c2845d9
# ╠═e5d3fbb8-69cc-4e2d-8428-ad81e8cd9060
# ╠═1d38ede9-dc38-40ce-9801-2fc195542887
# ╠═c76785e3-e760-4d3c-b962-7c173022384d
# ╠═33e853f3-958f-426f-a01a-799d33f44c1d
# ╠═a8df2b89-0beb-4916-9beb-3ff5c1dd8de3
# ╠═2565c6a2-d613-4b55-91ec-58674b2a9454
# ╠═6c5c0241-6a3d-4136-9c22-bcaff1e5740f
# ╠═190f2c04-acf5-4eff-8755-fe51e63b27b6
# ╠═01b70c8d-8ddc-41e9-a29b-07294a655b76
# ╠═8b5786c4-8402-4a97-bdca-6854d24b5612
# ╠═2d3aa3b3-c1d1-4128-bca8-f8b131412791
# ╠═4babcfbc-2094-4402-b79a-1f6f0e84d63f
# ╠═c12c27f7-e929-45ab-86b6-542ca9506cdf
# ╠═8aefd2b3-1744-4b0d-bf38-1c27390d7a14
# ╠═b7262978-acff-42cd-878b-a3fa6427a732
# ╠═ff1349dd-46e6-4335-85e4-24e165c4afe7
# ╠═9f95d8bb-e0d3-45cd-9219-9281c621e3f2
# ╠═edb0887d-54a3-45ba-a3ca-95569c7b6b55
# ╠═866fe0e8-e30d-4b75-92bc-3ca15832cbab
# ╠═d6cea940-6e77-4b8e-bd73-f718a9e50e3c
# ╠═f57ad76f-2d28-4c09-8a5f-7c5c38e2cc0c
# ╠═80761690-7b40-4866-ad39-bdfe10f09655
# ╠═ddef8c59-cde1-4c6c-af92-0b45214161bf
# ╠═575852fa-94d8-4f2b-aeba-28d5c07a1104
# ╠═03e6c027-f886-47d5-a864-c69435b8cde4
# ╠═9e865400-e4a5-4ac9-aa3c-61c3646056b7
# ╠═0e7721b5-a785-465f-971d-393a37508b91
# ╠═bad7a8cc-5f6d-4ce3-9388-bd1d5bc8168e
# ╠═480e27fb-0a18-4b30-af81-6fbd44e9ce58
# ╠═dd1ec5ca-bc9c-40a0-89f6-404c82822d66
# ╠═6acb4a47-640c-474c-8999-c611e2b81eb9
# ╠═6b0d8011-42fe-49dc-892c-61f8c153a671
# ╠═2d7327a4-bc1f-4c20-af6c-e3116c79921e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
