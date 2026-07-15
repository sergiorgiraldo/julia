### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 62bf19a1-4e05-4086-bb72-c9ca3fa58e7b
md"""
# Getting started

Topics:
1.  How to print
2. How to assign variables
3. How to comment
4. Syntax for basic math
"""

# ╔═╡ 5c0d859a-183c-42c4-8dce-64f3ef9f6253
md"""
## How to print

In Julia we usually use `println()` to print
"""

# ╔═╡ 9de0520e-af6b-4299-87ab-6adbe3752276
println("I'm excited to learn Julia!")

# ╔═╡ 4ed3567f-d378-4bba-b9b4-cf55addfbcd9
md"""
## How to assign variables

All we need is a variable name, value, and an equal's sign!<br>
Julia will figure out types for us.
"""

# ╔═╡ f8f84789-f9e5-4867-bfa8-aaf82a316e46
begin
	my_answer = 42
	println(typeof(my_answer))
end

# ╔═╡ c856592c-0de0-4af6-9432-885c98a1961a
begin
	my_pi = 3.14159
	
	println(typeof(my_pi))
end

# ╔═╡ f0b2386c-556f-42ee-83f4-cad346f8c1e9
begin
	😺 = "smiley cat!"
	println(typeof(😺))
end

# ╔═╡ e5c7dc55-fab3-46b7-bf4a-41c5ca3ea0db
md"""
To type a smiley cat, use tab completion to select the emoji name and then tab again
"""

# ╔═╡ 07da6bcf-d961-4c1e-bc19-9ee8acf1a77b
 # \:smi + <tab> --> select with down arrow + <enter> ---> <tab> + <enter> to complete
begin
	😼=2
	println(😼 * 2)
end

# ╔═╡ 50f741d7-9ac2-4899-93c9-e9fe2ccd447a
md"""
After assigning a value to a variable, we can reassign a value of a different type to that variable without any issue.
"""

# ╔═╡ 3c7ddebc-902f-452b-97f1-30ada9310ee2
😺_2 = 1

# ╔═╡ 29130684-04fd-49de-a06e-5a036a20d588
typeof(😺_2)

# ╔═╡ 4841df99-ecde-4a48-bd37-fa1b7f5bcfdc
md"""
Note: Julia allows us to write super generic code, and 😺 is an example of this. 

This allows us to write code like
"""

# ╔═╡ eaf29d64-326c-4d98-935c-77a5da8df450
begin
	😀 = 0
	😞 = -1
end

# ╔═╡ d0326eb4-94d6-43d2-b8ed-0ca1341c7b90
😺_2 + 😞 == 😀

# ╔═╡ 6a69081a-f4a6-40d7-bce0-3b7b10f664f2
md"""
## How to comment
"""

# ╔═╡ b39ef967-5a87-43f5-a989-2c635350108a
# You can leave comments on a single line using the pound/hash key

# ╔═╡ 5ab35485-3ee0-4662-aef2-6fbc7d28a151
begin
	#=

	For multi-line comments, 
	use the '#= =#' sequence.

	=#
end

# ╔═╡ 7a1251db-13cb-4baf-8532-651600b3af41
md"""
## Syntax for basic math
"""

# ╔═╡ 6238206a-9c22-43db-83aa-fe081fe86a33
sum = 3 + 7

# ╔═╡ cda988f2-d5f5-4c60-9516-380f6d895e7c
difference = 10 - 3

# ╔═╡ 606169dd-6d02-4ac7-bcbe-d8f97d952b4a
product = 20 * 5

# ╔═╡ b1d6a6fd-0c58-4870-a2c9-ac74aad78e67
quotient = 100 / 10

# ╔═╡ 5c8fc591-85a2-4915-bd56-8511e529e2f2
power = 10 ^ 2

# ╔═╡ 31dd1c0f-0de3-4738-94a5-afab2afafe56
modulus = 101 % 2

# ╔═╡ d42c5930-ce82-4b1a-82cb-9b96b6468c14
md"""
### Exercises

#### 1.1 
Look up docs for the `convert` function.
"""

# ╔═╡ 72973c89-aa3a-48dc-9bcf-0f450d527722
md"""
#### 1.2 
Assign `365` to a variable named `days`. Convert `days` to a float and assign it to variable `days_float`
"""

# ╔═╡ 8e56c5ff-7177-4f86-9ed0-377b833b01f4
begin
	days=365
	@assert days == 365
	days_float=convert(Float16, days)
	@assert days_float == 365.0
end

# ╔═╡ c2c2216b-32de-4ada-a0a4-91fbe9aec317
md"""
#### 1.3 
See what happens when you execute

```julia
convert(Int64, "1")
```
and

```julia
parse(Int64, "1")
```
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
# ╠═62bf19a1-4e05-4086-bb72-c9ca3fa58e7b
# ╠═5c0d859a-183c-42c4-8dce-64f3ef9f6253
# ╠═9de0520e-af6b-4299-87ab-6adbe3752276
# ╠═4ed3567f-d378-4bba-b9b4-cf55addfbcd9
# ╠═f8f84789-f9e5-4867-bfa8-aaf82a316e46
# ╠═c856592c-0de0-4af6-9432-885c98a1961a
# ╠═f0b2386c-556f-42ee-83f4-cad346f8c1e9
# ╠═e5c7dc55-fab3-46b7-bf4a-41c5ca3ea0db
# ╠═07da6bcf-d961-4c1e-bc19-9ee8acf1a77b
# ╠═50f741d7-9ac2-4899-93c9-e9fe2ccd447a
# ╠═3c7ddebc-902f-452b-97f1-30ada9310ee2
# ╠═29130684-04fd-49de-a06e-5a036a20d588
# ╠═4841df99-ecde-4a48-bd37-fa1b7f5bcfdc
# ╠═eaf29d64-326c-4d98-935c-77a5da8df450
# ╠═d0326eb4-94d6-43d2-b8ed-0ca1341c7b90
# ╠═6a69081a-f4a6-40d7-bce0-3b7b10f664f2
# ╠═b39ef967-5a87-43f5-a989-2c635350108a
# ╠═5ab35485-3ee0-4662-aef2-6fbc7d28a151
# ╠═7a1251db-13cb-4baf-8532-651600b3af41
# ╠═6238206a-9c22-43db-83aa-fe081fe86a33
# ╠═cda988f2-d5f5-4c60-9516-380f6d895e7c
# ╠═606169dd-6d02-4ac7-bcbe-d8f97d952b4a
# ╠═b1d6a6fd-0c58-4870-a2c9-ac74aad78e67
# ╠═5c8fc591-85a2-4915-bd56-8511e529e2f2
# ╠═31dd1c0f-0de3-4738-94a5-afab2afafe56
# ╠═d42c5930-ce82-4b1a-82cb-9b96b6468c14
# ╠═72973c89-aa3a-48dc-9bcf-0f450d527722
# ╠═8e56c5ff-7177-4f86-9ed0-377b833b01f4
# ╠═c2c2216b-32de-4ada-a0a4-91fbe9aec317
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
