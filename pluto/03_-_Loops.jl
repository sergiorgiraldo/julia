### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 40bbb6be-79db-45b7-ae44-70d8a939af11
md"""
# Loops

Topics:
1. `while` loops
2. `for` loops
<br>

## while loops

The syntax for a `while` is

```julia
while *condition*
    *loop body*
end
```

For example, we could use `while` to count or to iterate over an array.
"""

# ╔═╡ b61bbd4b-30d6-4998-8025-0d6ffcd12d1f
begin
	n = 0
	while n < 10
	    n += 1
	    println(n)
	end
	n
end

# ╔═╡ 4d838cf8-aab6-49dd-b015-e8099266fca6
begin
	myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

	i = 1
	while i <= length(myfriends)
	    friend = myfriends[i]
	    println("Hi $friend, it's great to see you!")
	    i += 1
	end
end

# ╔═╡ ed86f3b1-8c8d-4a1d-8b77-d90f94fc099f
md"""
## for loops

The syntax for a `for` loop is

```julia
for *var* in *loop iterable*
    *loop body*
end
```

We could use a for loop to generate the same results as either of the examples above:
"""

# ╔═╡ c28169c9-ce5c-49d2-af8b-5aa210791b2b
begin
	for n in 1:10
	    println(n)
	end
end

# ╔═╡ 19e06926-83cf-4e00-889a-fd2ff3429f3b
begin
	myfriends_2 = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

	for friend in myfriends_2
	    println("Hi $friend, it's great to see you!")
	end
end

# ╔═╡ 71a88ec7-e349-4099-9e1f-05d94115d393
md"""
Now let's use `for` loops to create some addition tables, where the value of every entry is the sum of its row and column indices. <br>

Note that we iterate over this array via column-major loops in order to get the best performance. More information about fast indexing of multidimensional arrays inside nested loops can be found at https://docs.julialang.org/en/v1/manual/performance-tips/#Access-arrays-in-memory-order,-along-columns-1

First, we initialize an array with zeros.
"""

# ╔═╡ fa4545d1-e927-4963-a84e-c9ddf32e6c51
begin
	m, n_2 = 5, 5
	A = fill(0, (m, n_2))
end

# ╔═╡ c390309b-6d4a-4cd5-9f88-51f5c2629490
begin
	for j in 1:n_2
	    for i in 1:m
	        A[i, j] = i + j
	    end
	end
	A
end

# ╔═╡ dec71cb8-6bef-4c81-971d-83c3906447d0
md"""
Here's some syntactic sugar for the same nested `for` loop
"""

# ╔═╡ 7cdf7df8-b48b-4023-abdf-1ff5ecfd7b84
B = fill(0, (m, n_2))

# ╔═╡ 62262c3b-d752-4aae-a517-5d73ce571c08
begin
	for j in 1:n_2, i in 1:m
	    B[i, j] = i + j
	end
	B
end

# ╔═╡ a032082e-0c78-4456-8033-cac932dfbdd0
md"""
The more "Julia" way to create this addition table would have been with an *array comprehension*.
"""

# ╔═╡ 1bd14df4-54dc-423b-aced-6de48ee9cdac
C = [i + j for i in 1:m, j in 1:n_2]

# ╔═╡ d28f0920-c259-47e1-a316-6580811a45f9
C

# ╔═╡ ad4c3677-3e57-47b4-b374-f09af8f8d1d0
md"""
### Exercises

#### 4.1 
Loop over integers between 1 and 100 and print their squares.
"""

# ╔═╡ b9b14283-e125-4af7-a1fd-860d486c1ca8
for i in 1:100
	println("$i - $(i*i)")
end

# ╔═╡ a8d8b2ba-8fc6-4929-beba-619598dc6cdb
md"""
#### 4.2 
Add to the code above a bit to create a dictionary, `squares` that holds integers and their squares as key, value pairs such that

```julia
squares[10] == 100
```
"""

# ╔═╡ 4e617fdb-f0d3-400a-8fd8-a8a30e6b0c7b
begin
	squares = Dict{Int16, Int16}()
	for i in 1:100
		squares[i] = i * i
	end
end

# ╔═╡ f8da7802-0185-40ef-81d7-465706a115ab
begin
	@assert squares[10] == 100
	@assert squares[11] == 121
end

# ╔═╡ 6f89ce07-ff33-4a8d-9849-e7a2c2bf92c5
md"""
#### 4.3 
Use an array comprehension to create an an array `squares_arr` that stores the squares for all integers between 1 and 100.
"""

# ╔═╡ c4d435af-9771-4cdf-86fa-f14f4bb5abaa
squares_arr = [i * i for i in 1:100]

# ╔═╡ 7deaa8c5-ed77-4644-b422-cc9eabe74305
begin
	@assert length(squares_arr) == 100
	@assert sum(squares_arr) == 338350
end

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
# ╠═40bbb6be-79db-45b7-ae44-70d8a939af11
# ╠═b61bbd4b-30d6-4998-8025-0d6ffcd12d1f
# ╠═4d838cf8-aab6-49dd-b015-e8099266fca6
# ╠═ed86f3b1-8c8d-4a1d-8b77-d90f94fc099f
# ╠═c28169c9-ce5c-49d2-af8b-5aa210791b2b
# ╠═19e06926-83cf-4e00-889a-fd2ff3429f3b
# ╠═71a88ec7-e349-4099-9e1f-05d94115d393
# ╠═fa4545d1-e927-4963-a84e-c9ddf32e6c51
# ╠═c390309b-6d4a-4cd5-9f88-51f5c2629490
# ╠═dec71cb8-6bef-4c81-971d-83c3906447d0
# ╠═7cdf7df8-b48b-4023-abdf-1ff5ecfd7b84
# ╠═62262c3b-d752-4aae-a517-5d73ce571c08
# ╠═a032082e-0c78-4456-8033-cac932dfbdd0
# ╠═1bd14df4-54dc-423b-aced-6de48ee9cdac
# ╠═d28f0920-c259-47e1-a316-6580811a45f9
# ╠═ad4c3677-3e57-47b4-b374-f09af8f8d1d0
# ╠═b9b14283-e125-4af7-a1fd-860d486c1ca8
# ╠═a8d8b2ba-8fc6-4929-beba-619598dc6cdb
# ╠═4e617fdb-f0d3-400a-8fd8-a8a30e6b0c7b
# ╠═f8da7802-0185-40ef-81d7-465706a115ab
# ╠═6f89ce07-ff33-4a8d-9849-e7a2c2bf92c5
# ╠═c4d435af-9771-4cdf-86fa-f14f4bb5abaa
# ╠═7deaa8c5-ed77-4644-b422-cc9eabe74305
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
