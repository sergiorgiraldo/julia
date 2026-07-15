### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ ea87e14d-c8be-4084-bb12-8a5251d93c16
md"""
# Multiple dispatch
"""

# ╔═╡ e64fc956-e623-4483-8fd3-44e3f16eb453
md"""
In this notebook we'll explore **multiple dispatch**, which is a key feature of Julia.

Multiple dispatch makes software *generic* and *fast*!

#### Starting with the familiar

To understand multiple dispatch in Julia, let's start with what we've already seen.

We can declare functions in Julia without giving Julia any information about the types of the input arguments that function will receive:
"""

# ╔═╡ bf808ac2-b706-4f73-9ef2-592d4c26ba56
f(x) = x.^2

# ╔═╡ 9348e25a-805c-4d0d-a42d-7e97aecbdd6a
md"""
and then Julia will determine on its own which input argument types make sense and which do not:
"""

# ╔═╡ 9b847ccc-d4fb-4d42-a7a5-9d475474c96d
f(10)

# ╔═╡ 39063bc0-8bba-41c9-bc5a-e061b0aa7f4e
f([1, 2, 3])

# ╔═╡ 278b61d8-78c2-4ea1-b8ac-66f97f6b05bc
md"""
#### Specifying the types of our input arguments

However, we also have the *option* to tell Julia explicitly what types our input arguments are allowed to have.

For example, let's write a function `foo` that only takes strings as inputs.
"""

# ╔═╡ 759e4c74-29e7-43ea-aba5-bf921b5a9a65
foo(x::String, y::String) = println("My inputs x and y are both strings!")

# ╔═╡ 3f932d5c-15aa-4598-97b0-f6a78cfd293a
md"""
We see here that in order to restrict the type of `x` and `y` to `String`s, we just follow the input argument name by a double colon and the keyword `String`.

Now we'll see that `foo` works on `String`s and doesn't work on other input argument types.
"""

# ╔═╡ 882ac021-0f7c-4cab-9a5f-148420154dd5
md"""
To get `foo` to work on integer (`Int`) inputs, let's tack `::Int` onto our input arguments when we declare `foo`.
"""

# ╔═╡ c6c3c244-876d-47d6-8483-aa91fdd13db2
foo(x::Int, y::Int) = println("My inputs x and y are both integers!")

# ╔═╡ 9e7839e3-530d-41d9-af22-8e47a26acffe
md"""
Now `foo` works on integers! But look, `foo` also still works when `x` and `y` are strings!
"""

# ╔═╡ de8f9df4-b197-4323-a4ee-3e1be80f8a6f
md"""
This is starting to get to the heart of multiple dispatch. When we declared

```julia
foo(x::Int, y::Int) = println("My inputs x and y are both integers!")
```
we didn't overwrite or replace
```julia
foo(x::String, y::String)
```
Instead, we just added an additional ***method*** to the ***generic function*** called `foo`.

A ***generic function*** is the abstract concept associated with a particular operation.

For example, the generic function `+` represents the concept of addition.

A ***method*** is a specific implementation of a generic function for *particular argument types*.

For example, `+` has methods that accept floating point numbers, integers, matrices, etc.

We can use the `methods` to see how many methods there are for `foo`.
"""

# ╔═╡ 1f52592b-5ae7-415d-8aaa-f8f00babccd1
md"""
Aside: how many methods do you think there are for addition?
"""

# ╔═╡ 1ae4bee8-979a-49c2-901e-9ad15506751b
methods(+)

# ╔═╡ c2eacc27-48d8-4b16-bf7f-c648a018c291
md"""
So, we now can call `foo` on integers or strings. When you call `foo` on a particular set of arguments, Julia will infer the types of the inputs and dispatch the appropriate method. *This* is multiple dispatch.

Multiple dispatch makes our code generic and fast. Our code can be generic and flexible because we can write code in terms of abstract operations such as addition and multiplication, rather than in terms of specific implementations. At the same time, our code runs quickly because Julia is able to call efficient methods for the relevant types.

To see which method is being dispatched when we call a generic function, we can use the @which macro:
"""

# ╔═╡ 918326d0-8d51-4134-9a24-c2453a392e41
md"""
Let's see what happens when we use `@which` with the addition operator!
"""

# ╔═╡ 398d9146-c325-4e1e-9972-80bfbc2b8702
@which 3.0 + 3.0

# ╔═╡ 24451ca4-6955-4e82-8893-3e448d403912
md"""
And we can continue to add other methods to our generic function `foo`. Let's add one that takes the ***abstract type*** `Number`, which includes subtypes such as `Int`, `Float64`, and other objects you would think of as numbers:
"""

# ╔═╡ 1ff64613-4201-4396-9804-bf8b8db4809d
foo(x::Number, y::Number) = println("My inputs x and y are both numbers!")

# ╔═╡ 834d55d1-38c0-4ae6-80f1-6703731573dc
md"""
This method for `foo` will work on, for example, floating point numbers:
"""

# ╔═╡ 4d5e5290-02c4-4b3a-a5b7-cdb10ee7fb0e
md"""
We can also add a fallback, duck-typed method for `foo` that takes inputs of any type:
"""

# ╔═╡ 718d6f9c-962d-4c64-a3e4-aa6505001085
foo(x, y) = println("I accept inputs of any type!")

# ╔═╡ 167c1567-029d-4815-bbe7-7d7055063070
foo("hello", "hi!")

# ╔═╡ 71671913-4aec-4328-9847-cee20a1001ec
foo(3, 4)

# ╔═╡ 88b62eed-f8da-42ed-9d5d-f512560e88aa
foo(3, 4)

# ╔═╡ 31f46598-1ec6-4934-90d7-80c6211dfb7b
foo("hello", "hi!")

# ╔═╡ cf73808d-5021-4297-a0ec-03e80cbbb201
methods(foo)

# ╔═╡ f10b7cd3-7c0d-48f5-b9b1-7be5c2caa709
@which foo(3, 4)

# ╔═╡ 2ee55948-9304-4244-ba98-8460799117aa
foo(3.0, 4.0)

# ╔═╡ d41230f1-824f-4d50-9d1c-bcf6f5d8fbd6
md"""
Given the methods we've already written for `foo` so far, this method will be called whenever we pass non-numbers to `foo`:
"""

# ╔═╡ fe066371-18e1-46df-bd99-d50cadb8efd8
begin
	v = rand(3)
	foo(v, v)
end

# ╔═╡ c66afa64-703b-42a8-b82f-166da33d0cd2
md"""
### Exercises

#### 9.1

Extend the function `foo`, adding a method that takes only one input argument, which is of type `Bool`, and returns "foo with one boolean!"
"""

# ╔═╡ 91e4658b-9a26-45c3-bfaa-9f2b6ce2f93b
md"""
#### 9.2

Check that the method being dispatched when you execute 
```julia
foo(true)
```
is the one you wrote.
"""

# ╔═╡ b8eabf77-139d-4b93-8886-0ae93b0a3f56
@assert foo(true) == "foo with one boolean!"

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
# ╠═ea87e14d-c8be-4084-bb12-8a5251d93c16
# ╠═e64fc956-e623-4483-8fd3-44e3f16eb453
# ╠═bf808ac2-b706-4f73-9ef2-592d4c26ba56
# ╠═9348e25a-805c-4d0d-a42d-7e97aecbdd6a
# ╠═9b847ccc-d4fb-4d42-a7a5-9d475474c96d
# ╠═39063bc0-8bba-41c9-bc5a-e061b0aa7f4e
# ╠═278b61d8-78c2-4ea1-b8ac-66f97f6b05bc
# ╠═759e4c74-29e7-43ea-aba5-bf921b5a9a65
# ╠═3f932d5c-15aa-4598-97b0-f6a78cfd293a
# ╠═167c1567-029d-4815-bbe7-7d7055063070
# ╠═71671913-4aec-4328-9847-cee20a1001ec
# ╠═882ac021-0f7c-4cab-9a5f-148420154dd5
# ╠═c6c3c244-876d-47d6-8483-aa91fdd13db2
# ╠═88b62eed-f8da-42ed-9d5d-f512560e88aa
# ╠═9e7839e3-530d-41d9-af22-8e47a26acffe
# ╠═31f46598-1ec6-4934-90d7-80c6211dfb7b
# ╠═de8f9df4-b197-4323-a4ee-3e1be80f8a6f
# ╠═cf73808d-5021-4297-a0ec-03e80cbbb201
# ╠═1f52592b-5ae7-415d-8aaa-f8f00babccd1
# ╠═1ae4bee8-979a-49c2-901e-9ad15506751b
# ╠═c2eacc27-48d8-4b16-bf7f-c648a018c291
# ╠═f10b7cd3-7c0d-48f5-b9b1-7be5c2caa709
# ╠═918326d0-8d51-4134-9a24-c2453a392e41
# ╠═398d9146-c325-4e1e-9972-80bfbc2b8702
# ╠═24451ca4-6955-4e82-8893-3e448d403912
# ╠═1ff64613-4201-4396-9804-bf8b8db4809d
# ╠═834d55d1-38c0-4ae6-80f1-6703731573dc
# ╠═2ee55948-9304-4244-ba98-8460799117aa
# ╠═4d5e5290-02c4-4b3a-a5b7-cdb10ee7fb0e
# ╠═718d6f9c-962d-4c64-a3e4-aa6505001085
# ╠═d41230f1-824f-4d50-9d1c-bcf6f5d8fbd6
# ╠═fe066371-18e1-46df-bd99-d50cadb8efd8
# ╠═c66afa64-703b-42a8-b82f-166da33d0cd2
# ╠═91e4658b-9a26-45c3-bfaa-9f2b6ce2f93b
# ╠═b8eabf77-139d-4b93-8886-0ae93b0a3f56
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
