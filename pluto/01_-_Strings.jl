### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 365a6dcd-3d27-4cba-83fc-58a5d631bdac
md"""
# Strings

Topics:
1. How to get a string
2. String interpolation
3. String concatenation
"""

# ╔═╡ 3f79943a-c5b7-4993-8343-bf611669eca5
md"""
## How to get a string

Enclose your characters in " " or \"\"\" \"\"\"!
"""

# ╔═╡ 81d76866-4cd7-4747-8dda-61e41097b190
s1 = "I am a string."

# ╔═╡ e1fa1dac-dce5-44ca-bc7b-6229031a5d4c
s2 = """I am also a string. """

# ╔═╡ b1770c87-75c2-4f8f-b060-8578663d090c
md"""
There are a couple functional differences between strings enclosed in single and triple quotes. <br>
One difference is that, in the latter case, you can use quotation marks within your string.
"""

# ╔═╡ 205be301-7611-40da-bd4e-e7e9fb66acf8
"Here, we get an "error" because it's ambiguous where this string ends "

# ╔═╡ b6d1c2f3-5f50-4e7a-b222-13c791ee24db
"""Look, Mom, no "errors"!!! """

# ╔═╡ ffe98a93-be14-4be5-b052-a33afb43f9c1
md"""
Note that ' ' define a character, but NOT a string!
"""

# ╔═╡ f88be5fd-7229-4704-a853-868900c719dd
typeof("a")

# ╔═╡ 9f97b1f3-fb9c-49c1-8dd7-bb2417bb67ff
"We will get an error here"

# ╔═╡ 4e95ac23-71c7-4a17-bc66-9fdc566f6d2a
md"""
## String interpolation

We can use the $ sign to insert existing variables into a string and to evaluate expressions within a string. <br>
Below is an example that contains some highly sensitive personal information.
"""

# ╔═╡ 05881e11-c439-4ffd-9903-ab85ec1f5fa3
begin
	name = "Jane"
	num_fingers = 10
	num_toes = 10
end

# ╔═╡ d504cecc-a053-474e-bc72-45bb425b30dc
begin
	println("Hello, my name is $name.")
	println("I have $num_fingers fingers and $num_toes toes.")
end

# ╔═╡ 6302ae47-8639-4b4c-b0d4-38dd061adcf3
 println("That is $(num_fingers + num_toes) digits in all!!")

# ╔═╡ a02a7547-ffa6-49ec-90ed-06cab6d6bac1
md"""
## String concatenation

Below are three ways we can concatenate strings! <br><br>
The first way is to use the `string()` function. <br>
`string()` converts non-string inputs to strings.
"""

# ╔═╡ e9d3d904-2bfa-4664-aeae-a1da35eacd2d
begin
	s3 = "How many cats ";
	s4 = "is too many cats?";
	😺 = 10
end

# ╔═╡ 720c4466-6e80-4aed-a270-e77d08f9ef58
string(s3, s4)

# ╔═╡ 6b4ae1ac-3ce2-491b-a25e-457beb076091
string("I don't know, but ", 😺, " is too few.")

# ╔═╡ 154a5db0-5283-4f98-aa94-5915e1936466
string("I don't know, but $😺 is too few.")

# ╔═╡ a7b6c473-ffed-407e-9b93-1fffe387dbf2
md"""
We can also use `*` for concatenation!
"""

# ╔═╡ 63d23f79-eefe-49ec-9e5b-8274a1374766
s3*s4

# ╔═╡ 241420b6-5718-4169-9cad-dbfb55ad96d1
md"""
### Exercises

#### 2.1 
Create a string that says "hi" 1000 times, first with `repeat` and then with the exponentiation operator, which can call `*` under the hood. Assign it the variable `hi` below.
"""

# ╔═╡ 02ab0708-61e4-4640-a159-797d1dfa6991
hi=repeat("hi",1000)

# ╔═╡ 2286422d-7a75-4c04-91cd-b06c3cedd5e6

@assert hi == "hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi"

# ╔═╡ ccd46efd-20cf-41e6-909d-5b3cd0b1feec
md"""
#### 2.2 
Declare two variables

```julia
a = 3
b = 4
```
and use them to create two strings:
```julia
"3 + 4"
"7" 
```
and store the results in `c` and `d` respectively
"""

# ╔═╡ 5dc0210c-31a0-42ea-b70c-c62a3b58232d
begin
	a = 3
	b = 4
	c = "$a + $b"
	d = string(a + b)
end

# ╔═╡ b032cd84-a47c-4962-b7df-0b6fddd85f9d
begin
	@assert c == "3 + 4"
	@assert d == "7"
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
# ╠═365a6dcd-3d27-4cba-83fc-58a5d631bdac
# ╠═3f79943a-c5b7-4993-8343-bf611669eca5
# ╠═81d76866-4cd7-4747-8dda-61e41097b190
# ╠═e1fa1dac-dce5-44ca-bc7b-6229031a5d4c
# ╠═b1770c87-75c2-4f8f-b060-8578663d090c
# ╠═205be301-7611-40da-bd4e-e7e9fb66acf8
# ╠═b6d1c2f3-5f50-4e7a-b222-13c791ee24db
# ╠═ffe98a93-be14-4be5-b052-a33afb43f9c1
# ╠═f88be5fd-7229-4704-a853-868900c719dd
# ╠═9f97b1f3-fb9c-49c1-8dd7-bb2417bb67ff
# ╠═4e95ac23-71c7-4a17-bc66-9fdc566f6d2a
# ╠═05881e11-c439-4ffd-9903-ab85ec1f5fa3
# ╠═d504cecc-a053-474e-bc72-45bb425b30dc
# ╠═6302ae47-8639-4b4c-b0d4-38dd061adcf3
# ╠═a02a7547-ffa6-49ec-90ed-06cab6d6bac1
# ╠═e9d3d904-2bfa-4664-aeae-a1da35eacd2d
# ╠═720c4466-6e80-4aed-a270-e77d08f9ef58
# ╠═6b4ae1ac-3ce2-491b-a25e-457beb076091
# ╠═154a5db0-5283-4f98-aa94-5915e1936466
# ╠═a7b6c473-ffed-407e-9b93-1fffe387dbf2
# ╠═63d23f79-eefe-49ec-9e5b-8274a1374766
# ╠═241420b6-5718-4169-9cad-dbfb55ad96d1
# ╠═02ab0708-61e4-4640-a159-797d1dfa6991
# ╠═2286422d-7a75-4c04-91cd-b06c3cedd5e6
# ╠═ccd46efd-20cf-41e6-909d-5b3cd0b1feec
# ╠═5dc0210c-31a0-42ea-b70c-c62a3b58232d
# ╠═b032cd84-a47c-4962-b7df-0b6fddd85f9d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
