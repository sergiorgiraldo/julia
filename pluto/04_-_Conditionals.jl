### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ a48fc333-e8b1-47f9-9c3d-9e289767ab6b
md"""
# Conditionals

#### with the `if` keyword
In Julia, the syntax

```julia
if *condition 1*
    *option 1*
elseif *condition 2*
    *option 2*
else
    *option 3*
end
```

allows us to conditionally evaluate one of our options.
<br><br>
For example, we might want to implement the FizzBuzz test: given a number, N, print "Fizz" if N is divisible by 3, "Buzz" if N is divisible by 5, and "FizzBuzz" if N is divisible by 3 and 5. Otherwise just print the number itself! Enter your choice for `N` here:
"""

# ╔═╡ ab559476-ca52-404b-826b-8d149ceba172
N = 5

# ╔═╡ c35b1bbf-76d4-4e28-8325-e93176700f3c
begin
	if (N % 3 == 0) && (N % 5 == 0) # `&&` means "AND"; % computes the remainder after division
	    println("FizzBuzz")
	elseif N % 3 == 0
	    println("Fizz")
	elseif N % 5 == 0
	    println("Buzz")
	else
	    println(N)
	end
end

# ╔═╡ 2e7bd797-92c4-4bb1-8705-65ec1e5e4fbd
md"""
#### with ternary operators

For this last block, we could instead use the ternary operator with the syntax

```julia
a ? b : c
```

which equates to 

```julia
if a
    b
else
    c
end
```
"""

# ╔═╡ e71c47be-f25c-4a5b-afa5-420942efb75b
md"""
Now let's say we want to return the larger of two numbers. Give `x` and `y` values here:
"""

# ╔═╡ a6ba0757-87dc-43f4-be7b-c48d3a1d4bb1
begin
	x = 10
	y = 30
end

# ╔═╡ d355bcb5-62e7-4c8e-8256-2e06b6c40d4f
md"""
Using the `if` and `else` keywords, we might write:
"""

# ╔═╡ a248e730-1623-43c6-8ed0-273fd6e0ddaf
begin
	if x > y
	    x
	else
	    y
	end
end

# ╔═╡ ef2c3af5-7b66-4036-9986-9b845396813a
md"""
and as a ternary operator, the conditional looks like this:
"""

# ╔═╡ 9de94de9-763c-449f-904a-2b8066730d25
(x > y) ? x : y

# ╔═╡ edbb17e7-071d-48c4-a7b2-8fc48129b518
md"""
#### with short-circuit evaluation

We've already seen expressions with the syntax
```julia
a && b
```
to return true if both `a` and `b` are true. Of course, if `a` is false, Julia doesn't even need to know the value of `b` in order to determine that the overall result will be false. So Julia doesn't even need to check what `b` is; it can just "short-circuit" and immediately return `false`.  The second argument `b` might be a more complicated expression like a function call with a side-effect, in which case it won't even be called:
"""

# ╔═╡ 954a26dc-43b6-42fe-be3b-fa061c2c613e
false && (println("hi"); true)

# ╔═╡ 2f70dcdb-41c8-46df-bc53-16f3cd5be888
true && (println("hi"); true)

# ╔═╡ b672f9b3-6c3b-448a-9ea7-e08671ae72d1
md"""
On the other hand, if `a` is true, Julia knows it can just return the value of `b` as the overall expression. This means that `b` doesn't necessarily need evaluate to `true` or `false`!  `b` could even be an error:
"""

# ╔═╡ e627a1a0-d110-4f8d-aba1-55231f1a968f
(x > 0) && error("x cannot be greater than 0")

# ╔═╡ 7f5a706e-3232-4384-9a86-e28ac7252f15
md"""
Similarly, check out the `||` operator, which also uses short-circuit evaluation to perform the "or" operation.
"""

# ╔═╡ 446cdd3e-489f-4437-a9e0-3ccf386e9bca
true || println("hi")

# ╔═╡ 260613d1-4897-43ec-83bd-b1cbd6e586bf
md"""
and
"""

# ╔═╡ 7fb63a7c-98be-4337-abdc-e34b84ec7866
false || println("hi")

# ╔═╡ 87c45e87-5fd9-4630-ba35-20a40da9d11a
md"""
### Exercises

#### 5.1 
Write a conditional statement that prints a number if the number is even and the string "odd" if the number is odd.
"""

# ╔═╡ bf3c5d8e-256b-40d0-88bf-7b33c18c6ea6
md"""
#### 5.2 
Rewrite the code from 5.1 using a ternary operator.
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
# ╠═a48fc333-e8b1-47f9-9c3d-9e289767ab6b
# ╠═ab559476-ca52-404b-826b-8d149ceba172
# ╠═c35b1bbf-76d4-4e28-8325-e93176700f3c
# ╠═2e7bd797-92c4-4bb1-8705-65ec1e5e4fbd
# ╠═e71c47be-f25c-4a5b-afa5-420942efb75b
# ╠═a6ba0757-87dc-43f4-be7b-c48d3a1d4bb1
# ╠═d355bcb5-62e7-4c8e-8256-2e06b6c40d4f
# ╠═a248e730-1623-43c6-8ed0-273fd6e0ddaf
# ╠═ef2c3af5-7b66-4036-9986-9b845396813a
# ╠═9de94de9-763c-449f-904a-2b8066730d25
# ╠═edbb17e7-071d-48c4-a7b2-8fc48129b518
# ╠═954a26dc-43b6-42fe-be3b-fa061c2c613e
# ╠═2f70dcdb-41c8-46df-bc53-16f3cd5be888
# ╠═b672f9b3-6c3b-448a-9ea7-e08671ae72d1
# ╠═e627a1a0-d110-4f8d-aba1-55231f1a968f
# ╠═7f5a706e-3232-4384-9a86-e28ac7252f15
# ╠═446cdd3e-489f-4437-a9e0-3ccf386e9bca
# ╠═260613d1-4897-43ec-83bd-b1cbd6e586bf
# ╠═7fb63a7c-98be-4337-abdc-e34b84ec7866
# ╠═87c45e87-5fd9-4630-ba35-20a40da9d11a
# ╠═bf3c5d8e-256b-40d0-88bf-7b33c18c6ea6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
