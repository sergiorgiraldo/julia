### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 9e78d77c-bc1f-4ca1-96a7-cc5b8436337e
md"""
# Data structures

Once we start working with many pieces of data at once, it will be convenient for us to store data in structures like arrays or dictionaries (rather than just relying on variables).<br>

Types of data structures covered:
1. Tuples
2. Dictionaries
3. Arrays

As an overview, tuples and arrays are both ordered sequences of elements (so we can index into them). Dictionaries and arrays are both mutable.
We'll explain this more below!
"""

# ╔═╡ 410623a0-1868-40c4-a607-1988b2645f6c
md"""
## Tuples

We can create a tuple by enclosing an ordered collection of elements in `( )`.

Syntax: <br>
```julia
(item1, item2, ...)
```

"""

# ╔═╡ e99066a0-8723-499b-88b5-ed6a6903bb8e
myfavoriteanimals = ("penguins", "cats", "sugargliders")

# ╔═╡ bdcc5023-0100-4574-8a14-df93f026c6d0
md"""
We can index into this tuple,
"""

# ╔═╡ d5f3fd0b-4b6e-45dc-a074-597ea3f9711a
myfavoriteanimals[1]

# ╔═╡ fd3ab94c-cd14-4138-9ede-a7438160f149
md"""
but since tuples are immutable, we can't update it
"""

# ╔═╡ c2550d23-6a42-4881-9ace-86714aed390a
myfavoriteanimals[1] = "otters"

# ╔═╡ b9d3cc59-7bb4-48ad-96a1-e54c7c2a5c97
md"""
## Now in 1.6: NamedTuples

As you might guess, `NamedTuple`s are just like `Tuple`s except that each element additionally has a name! They have a special syntax using `=` inside a tuple:

```julia
(name1 = item1, name2 = item2, ...)
```
"""

# ╔═╡ da5cd82c-9601-4c73-9ffc-feb1e42419e0
myfavoriteanimals_2 = (bird = "penguins", mammal = "cats", marsupial = "sugargliders")

# ╔═╡ 203e27bd-4e00-4743-8f19-efbd47f6343c
md"""
Like regular `Tuples`, `NamedTuples` are ordered, so we can retrieve their elements via indexing:
"""

# ╔═╡ 291bab57-8934-42af-a683-153b86fee654
myfavoriteanimals_2[1]

# ╔═╡ 4603f869-8612-4b4b-a576-47ed05873214
md"""
They also add the special ability to access values by their name:
"""

# ╔═╡ 45c6f9d8-deba-4c3f-b8cf-0a354a61bf94
myfavoriteanimals_2.bird

# ╔═╡ d4681507-434c-4782-83a6-1754e6fa0618
md"""
## Dictionaries

If we have sets of data related to one another, we may choose to store that data in a dictionary. We can create a dictionary using the `Dict()` function, which we can initialize as an empty dictionary or one storing key, value pairs.

Syntax:
```julia
Dict(key1 => value1, key2 => value2, ...)
```

A good example is a contacts list, where we associate names with phone numbers.
"""

# ╔═╡ f73dd54b-c20c-4c55-b7ad-83c92a86ba16
myphonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

# ╔═╡ 7baee2ba-b854-445e-b640-81b9aff3bfa7
md"""
In this example, each name and number is a "key" and "value" pair. We can grab Jenny's number (a value) using the associated key
"""

# ╔═╡ e105dfd2-959e-40d6-b149-e22247406e87
myphonebook["Jenny"]

# ╔═╡ d2b7df86-5866-46ef-8c21-f78a71b92546
md"""
We can add another entry to this dictionary as follows
"""

# ╔═╡ fa9cfdff-e4bc-4ec9-93c1-ee586b441474
myphonebook["Kramer"] = "555-FILK"

# ╔═╡ 678c2f86-f2d1-4d39-b5e2-ee42290bca6f
md"""
Let's check what our phonebook looks like now...
"""

# ╔═╡ d769f54b-2876-4b23-9907-9f5da28e3414
myphonebook

# ╔═╡ a1575945-bf3a-420c-8b84-e1e467e9d583
md"""
We can delete Kramer from our contact list - and simultaneously grab his number - by using `pop!`
"""

# ╔═╡ 88c639e0-5ba7-40ed-ba6a-093a423a3425
pop!(myphonebook, "Kramer")

# ╔═╡ 42a63490-d8e0-4d7f-9b71-445bfa520fc9
myphonebook

# ╔═╡ 023b9cc9-5397-4244-ab6b-88cc5142cc2e
md"""
Unlike tuples and arrays, dictionaries are not ordered. So, we can't index into them.
"""

# ╔═╡ 62a71972-59f1-437d-9ea3-1318271f794c
myphonebook[1]

# ╔═╡ 7a16f6c7-91e6-4f39-b1c6-2d5f09b04605
md"""
In the example above, `julia` thinks you're trying to access a value associated with the key `1`.
"""

# ╔═╡ 272214f1-6276-4392-b9f7-535fce235722
md"""
## Arrays

Unlike tuples, arrays are mutable. Unlike dictionaries, arrays contain ordered collections. <br>
We can create an array by enclosing this collection in `[ ]`.

Syntax: <br>
```julia
[item1, item2, ...]
```


For example, we might create an array to keep track of my friends
"""

# ╔═╡ f6015060-1d1d-4c4e-a7e3-abc5c55caaa3
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

# ╔═╡ 9e409276-880d-4d34-9f80-2869af838a0b
md"""
The `1` in `Array{String,1}` means this is a one dimensional vector.  An `Array{String,2}` would be a 2d matrix, etc.  The `String` is the type of each element.
"""

# ╔═╡ ef7c0cb6-3725-4e25-93fa-494fdd62137c
md"""
or to store a sequence of numbers
"""

# ╔═╡ dc7f6fb8-03c0-44f9-8b08-8ad350f8cd6a
fibonacci = [1, 1, 2, 3, 5, 8, 13]

# ╔═╡ 6e84e1e0-cf91-4813-978f-47f5338e90df
mixture = [1, 1, 2, 3, "Ted", "Robyn"]

# ╔═╡ dbae0db1-b71c-44a8-9c33-ce18ddb2f85f
md"""
Once we have an array, we can grab individual pieces of data from inside that array by indexing into the array. For example, if we want the third friend listed in `myfriends`, we write
"""

# ╔═╡ 3f32d102-78e8-4b5a-85a8-5f53b44de032
myfriends[3]

# ╔═╡ e2928f03-45e4-4f03-aaa2-3847930a0e7a
md"""
We can use indexing to edit an existing element of an array
"""

# ╔═╡ c1f261fd-2656-4121-9fd7-5b25c74fc0c1
myfriends[3] = "Baby Bop"

# ╔═╡ c9035ffc-2375-4fb7-983b-15f8bcf203f0
md"""
Yes, Julia is 1-based indexing, not 0-based like Python.  Wars are fought over lesser issues. I have a friend with the wisdom of Solomon who proposes settling this once and for all with ½ 😃
"""

# ╔═╡ 17576fae-8da8-4fd6-8768-b116418d6ed1
md"""
We can also edit the array by using the `push!` and `pop!` functions. `push!` adds an element to the end of an array and `pop!` removes the last element of an array.

We can add another number to our fibonnaci sequence
"""

# ╔═╡ 89c478a2-56c5-47a7-a948-12b9b6b5879e
push!(fibonacci, 21)

# ╔═╡ 5f90f03f-1e34-4319-992a-a1b732179903
md"""
and then remove it
"""

# ╔═╡ 140641b1-0177-4a90-a956-94265d13667d
pop!(fibonacci)

# ╔═╡ ebaa97b3-0665-449c-a626-0539d3269c67
fibonacci

# ╔═╡ 9882802b-54fc-4768-bb6a-2af6bb328e00
md"""
So far I've given examples of only 1D arrays of scalars, but arrays can have an arbitrary number of dimensions and can also store other arrays. 
<br><br>
For example, the following are arrays of arrays:
"""

# ╔═╡ a3d205b2-0c0b-40bd-8cbc-be26b9ecccfe
favorites = [["koobideh", "chocolate", "eggs"],["penguins", "cats", "sugargliders"]]

# ╔═╡ dda716ff-3a2f-4857-baf1-8c33495aff78
numbers = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]

# ╔═╡ f296b613-5b3f-4af4-b6ba-da5cacccbc69
md"""
Below are examples of 2D and 3D arrays populated with random values.
"""

# ╔═╡ 7e07e3d0-4a30-4c36-b550-c985a764838d
rand(4, 3)

# ╔═╡ 8c48485d-308a-4b77-bf34-7988294a7de8
rand(4, 3, 2)

# ╔═╡ 44ff7a82-22c4-431c-8f41-5d6034f6405e
md"""
Be careful when you want to copy arrays!
"""

# ╔═╡ cfff09e0-bd24-48f1-9e67-a42765c56ad7
fibonacci

# ╔═╡ fe1cd731-ae84-4d79-8c1d-e82c5a76fb72
somenumbers = fibonacci

# ╔═╡ 3b18d98d-b0d8-4691-9afd-ed97424c248d
somenumbers[1] = 404

# ╔═╡ 7436aeab-723f-499d-b767-e046610be777
fibonacci

# ╔═╡ 572cb647-ce0e-49d6-81bb-a9cf60fca809
md"""
Editing `somenumbers` caused `fibonacci` to get updated as well!

In the above example, we didn't actually make a copy of `fibonacci`. We just created a new way to access the entries in the array bound to `fibonacci`.

If we'd like to make a copy of the array bound to `fibonacci`, we can use the `copy` function.
"""

# ╔═╡ 06630344-4264-464a-be9f-7fbd13634abb
begin
	# First, restore fibonacci
	fibonacci[1] = 1
	fibonacci
end

# ╔═╡ 5bbca7c5-400b-40e4-9b23-6e24abe72e82
somemorenumbers = copy(fibonacci)

# ╔═╡ 6417bc92-da97-4c6c-ab73-0981dc44f0e2
somemorenumbers[1] = 404

# ╔═╡ dac81545-cf0a-4e34-b509-0041bbd07df0
fibonacci

# ╔═╡ a07ac775-8563-41fa-9f4f-1d8dea635094
md"""
In this last example, fibonacci was not updated. Therefore we see that the arrays bound to `somemorenumbers` and `fibonacci` are distinct.
"""

# ╔═╡ f62669b3-925e-432e-aad0-0191b38ae8a8
md"""
### Exercises

#### 3.1 
Create an array, `a_ray`, with the following code:

```julia
a_ray = [1, 2, 3]
```

Add the number `4` to the end of this array and then remove it.
"""

# ╔═╡ 6e863514-f645-410c-b2fa-7729aa342e06
begin
	a_ray = [1,2,3]
	push!(a_ray,4)
	println(a_ray)
	pop!(a_ray)
	println(a_ray)
end

# ╔═╡ 1845657d-bd44-41aa-9445-f4d1c27e1cf8
@assert a_ray == [1, 2, 3]

# ╔═╡ e3c682c5-85af-4e3a-8965-de27becfb50f
myphonebook

# ╔═╡ 46b4ddab-ba1f-4684-9202-31b72c5d2769
md"""
#### 3.2 
Try to add "Emergency" as key to `myphonebook` with the value `string(911)` with the following code
```julia
myphonebook["Emergency"] = 911
```

Why doesn't this work?
"""

# ╔═╡ 3aad22a9-da5f-4eb0-82a8-b62cc946364e
md"dictionary is type-safe and in this case it only contains strings as values"

# ╔═╡ 772188a2-021f-419d-831f-bf4d4e97e54d
md"""
#### 3.3 
Create a new dictionary called `flexible_phonebook` that has Jenny's number stored as an integer and Ghostbusters' number stored as a string with the following code

```julia
flexible_phonebook = Dict("Jenny" => 8675309, "Ghostbusters" => "555-2368")
```
"""

# ╔═╡ a41b3f62-dbb7-48a5-aa71-e025a91f0596


# ╔═╡ 35238889-edf1-4313-b257-2879ce4f3d4c
@assert flexible_phonebook == Dict("Jenny" => 8675309, "Ghostbusters" => "555-2368")

# ╔═╡ a341fae1-4320-4ef7-a074-73c061038dee
md"""
#### 3.4 
Add the key "Emergency" with the value `911` (an integer) to `flexible_phonebook`.
"""

# ╔═╡ 4dcc20f3-17ee-40d4-b287-f7a49e5a9b36
@assert haskey(flexible_phonebook, "Emergency")

# ╔═╡ b01554f4-f706-4342-b220-d324a3bdf22d
@assert flexible_phonebook["Emergency"] == 911

# ╔═╡ de4597cd-721b-4495-9051-48ca4c6b3675
md"""
#### 3.5 
Why can we add an integer as a value to `flexible_phonebook` but not `myphonebook`? How could we have initialized `myphonebook` so that it would accept integers as values? (hint: try using [Julia's documentation for dictionaries](https://docs.julialang.org/en/v1/base/collections/#Dictionaries))
"""

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
# ╠═9e78d77c-bc1f-4ca1-96a7-cc5b8436337e
# ╠═410623a0-1868-40c4-a607-1988b2645f6c
# ╠═e99066a0-8723-499b-88b5-ed6a6903bb8e
# ╠═bdcc5023-0100-4574-8a14-df93f026c6d0
# ╠═d5f3fd0b-4b6e-45dc-a074-597ea3f9711a
# ╠═fd3ab94c-cd14-4138-9ede-a7438160f149
# ╠═c2550d23-6a42-4881-9ace-86714aed390a
# ╠═b9d3cc59-7bb4-48ad-96a1-e54c7c2a5c97
# ╠═da5cd82c-9601-4c73-9ffc-feb1e42419e0
# ╠═203e27bd-4e00-4743-8f19-efbd47f6343c
# ╠═291bab57-8934-42af-a683-153b86fee654
# ╠═4603f869-8612-4b4b-a576-47ed05873214
# ╠═45c6f9d8-deba-4c3f-b8cf-0a354a61bf94
# ╠═d4681507-434c-4782-83a6-1754e6fa0618
# ╠═f73dd54b-c20c-4c55-b7ad-83c92a86ba16
# ╠═7baee2ba-b854-445e-b640-81b9aff3bfa7
# ╠═e105dfd2-959e-40d6-b149-e22247406e87
# ╠═d2b7df86-5866-46ef-8c21-f78a71b92546
# ╠═fa9cfdff-e4bc-4ec9-93c1-ee586b441474
# ╠═678c2f86-f2d1-4d39-b5e2-ee42290bca6f
# ╠═d769f54b-2876-4b23-9907-9f5da28e3414
# ╠═a1575945-bf3a-420c-8b84-e1e467e9d583
# ╠═88c639e0-5ba7-40ed-ba6a-093a423a3425
# ╠═42a63490-d8e0-4d7f-9b71-445bfa520fc9
# ╠═023b9cc9-5397-4244-ab6b-88cc5142cc2e
# ╠═62a71972-59f1-437d-9ea3-1318271f794c
# ╠═7a16f6c7-91e6-4f39-b1c6-2d5f09b04605
# ╠═272214f1-6276-4392-b9f7-535fce235722
# ╠═f6015060-1d1d-4c4e-a7e3-abc5c55caaa3
# ╠═9e409276-880d-4d34-9f80-2869af838a0b
# ╠═ef7c0cb6-3725-4e25-93fa-494fdd62137c
# ╠═dc7f6fb8-03c0-44f9-8b08-8ad350f8cd6a
# ╠═6e84e1e0-cf91-4813-978f-47f5338e90df
# ╠═dbae0db1-b71c-44a8-9c33-ce18ddb2f85f
# ╠═3f32d102-78e8-4b5a-85a8-5f53b44de032
# ╠═e2928f03-45e4-4f03-aaa2-3847930a0e7a
# ╠═c1f261fd-2656-4121-9fd7-5b25c74fc0c1
# ╠═c9035ffc-2375-4fb7-983b-15f8bcf203f0
# ╠═17576fae-8da8-4fd6-8768-b116418d6ed1
# ╠═89c478a2-56c5-47a7-a948-12b9b6b5879e
# ╠═5f90f03f-1e34-4319-992a-a1b732179903
# ╠═140641b1-0177-4a90-a956-94265d13667d
# ╠═ebaa97b3-0665-449c-a626-0539d3269c67
# ╠═9882802b-54fc-4768-bb6a-2af6bb328e00
# ╠═a3d205b2-0c0b-40bd-8cbc-be26b9ecccfe
# ╠═dda716ff-3a2f-4857-baf1-8c33495aff78
# ╠═f296b613-5b3f-4af4-b6ba-da5cacccbc69
# ╠═7e07e3d0-4a30-4c36-b550-c985a764838d
# ╠═8c48485d-308a-4b77-bf34-7988294a7de8
# ╠═44ff7a82-22c4-431c-8f41-5d6034f6405e
# ╠═cfff09e0-bd24-48f1-9e67-a42765c56ad7
# ╠═fe1cd731-ae84-4d79-8c1d-e82c5a76fb72
# ╠═3b18d98d-b0d8-4691-9afd-ed97424c248d
# ╠═7436aeab-723f-499d-b767-e046610be777
# ╠═572cb647-ce0e-49d6-81bb-a9cf60fca809
# ╠═06630344-4264-464a-be9f-7fbd13634abb
# ╠═5bbca7c5-400b-40e4-9b23-6e24abe72e82
# ╠═6417bc92-da97-4c6c-ab73-0981dc44f0e2
# ╠═dac81545-cf0a-4e34-b509-0041bbd07df0
# ╠═a07ac775-8563-41fa-9f4f-1d8dea635094
# ╠═f62669b3-925e-432e-aad0-0191b38ae8a8
# ╠═6e863514-f645-410c-b2fa-7729aa342e06
# ╠═1845657d-bd44-41aa-9445-f4d1c27e1cf8
# ╠═e3c682c5-85af-4e3a-8965-de27becfb50f
# ╠═46b4ddab-ba1f-4684-9202-31b72c5d2769
# ╠═3aad22a9-da5f-4eb0-82a8-b62cc946364e
# ╠═772188a2-021f-419d-831f-bf4d4e97e54d
# ╠═a41b3f62-dbb7-48a5-aa71-e025a91f0596
# ╠═35238889-edf1-4313-b257-2879ce4f3d4c
# ╠═a341fae1-4320-4ef7-a074-73c061038dee
# ╠═4dcc20f3-17ee-40d4-b287-f7a49e5a9b36
# ╠═b01554f4-f706-4342-b220-d324a3bdf22d
# ╠═de4597cd-721b-4495-9051-48ca4c6b3675
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
