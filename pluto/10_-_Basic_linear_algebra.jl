### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 737a6b45-e15a-43ca-9199-47667f79330e
md"""
# Basic linear algebra in Julia
Author: Andreas Noack Jensen (MIT & JuliaComputing) (https://twitter.com/anoackjensen?lang=en)
(with edits from Jane Herriman)
"""

# ╔═╡ bcf98e21-592a-4c4d-8d4f-b9b7bb89c91c
md"""
First let's define a random matrix
"""

# ╔═╡ ed70792f-8259-40fc-87a7-905070b5bacb
A = rand(1:4,3,3)

# ╔═╡ b400dc72-5dbc-4d9b-81ad-855dd7b8695c
md"""
Define a vector of ones
"""

# ╔═╡ 743dc6a8-84a3-4e08-953a-fe22d39270cc
x = fill(1.0, (3,)) # = fill(1.0, 3)

# ╔═╡ 1530c0cf-0c02-4f96-9c70-6b2c5b77e544
md"""
Notice that $A$ has type Array{Int64,2} but $x$ has type Array{Float64,1}. Julia defines the aliases Vector{Type}=Array{Type,1} and Matrix{Type}=Array{Type,2}. 

Many of the basic operations are the same as in other languages
#### Multiplication
"""

# ╔═╡ 7928fab8-9396-4ff3-9fea-ad4e6a79d641
b = A*x

# ╔═╡ 41c94f96-28f7-4dc6-aeaf-1018f2828931
md"""
#### Transposition
As in other languages `A'` is the conjugate transpose, or adjoint
"""

# ╔═╡ 1ec5ef17-7527-4f79-af47-80cc9bbcd5ca
A'

# ╔═╡ 3d311807-f2c3-45ed-b833-da53b8002277
md"""
and we can get the transpose with
"""

# ╔═╡ 79b741f9-dab2-4bb7-be39-768a82cab798
transpose(A)

# ╔═╡ 8e0aa890-885a-4aa7-87aa-a924e4504de3
md"""
#### Transposed multiplication
Julia allows us to write this without *
"""

# ╔═╡ 83a80d2f-babb-48e4-a22a-92ee8477c01a
A'A

# ╔═╡ b3107d88-d17a-4ce6-950f-2365d3d3dddb
md"""
#### Solving linear systems 
The problem $Ax=b$ for ***square*** $A$ is solved by the \ function.
"""

# ╔═╡ b108bf6e-66aa-4213-90e9-c50d7593aa1d
A\b

# ╔═╡ 67f27e70-d720-4d74-acb4-674e61913286
md"""
`A\b` gives us the *least squares solution* if we have an overdetermined linear system (a "tall" matrix)
"""

# ╔═╡ 204e7b89-aea1-4af2-b08f-a36598287590
Atall = rand(3, 2)

# ╔═╡ f3520a30-aa30-435e-905b-a2f036cb9afc
Atall\b

# ╔═╡ ff87f695-fc7a-4438-ab01-b6384bb8ac89
md"""
and the *minimum norm least squares solution* if we have a rank-deficient least squares problem
"""

# ╔═╡ d2f42464-8d25-4e76-9b7b-106e12f8d2d9
begin
	v = rand(3)
	rankdef = hcat(v, v)
end

# ╔═╡ 828b67fb-ffcc-41ab-adec-06e55e299420
rankdef\b

# ╔═╡ d1afe106-fc52-4a38-9125-7b66b512b891
md"""
Julia also gives us the minimum norm solution when we have an underdetermined solution (a "short" matrix)
"""

# ╔═╡ cb1d26b9-8276-4c3a-8495-291bf3206aa9
begin
	bshort = rand(2)
	Ashort = rand(2, 3)
end

# ╔═╡ 2aa68272-3d7b-4a4f-9882-f7bc9ac80012
Ashort\bshort

# ╔═╡ da3b800c-817e-4952-a11c-7f25f7c47429
md"""
# The LinearAlgebra library

While much of linear algebra is available in Julia by default (as shown above), there's a standard library named `LinearAlgebra` that brings in many more relevant names and functions. In particular, it provides factorizations and some structured matrix types.  As with all packages, you can bring these additional features into your session with a `using LinearAlgebra`.
"""

# ╔═╡ 2037b0ab-ebd7-4021-a785-7e8103f67cba
md"""
### Exercises

#### 10.1 
Take the inner product (or "dot" product) of a vector `v` with itself and assign it to variable `dot_v`.


"""

# ╔═╡ 83f8eee4-a2e2-42b0-889a-69391c8de28d
v_2 = [1,2,3]

# ╔═╡ 5462a70b-14ec-4190-9bf3-aad3d5ec655e
@assert dot_v == 14

# ╔═╡ e1593e12-4d3d-49a0-8561-8f348a20b1b4
md"""
#### 10.2 
Take the outer product of a vector v with itself and assign it to variable `outer_v`
"""

# ╔═╡ 88725703-7f23-4535-aac5-f9957745c7e3
@assert outer_v == [1 2 3
                    2 4 6
                    3 6 9]

# ╔═╡ 9bd7daca-ee0f-4a31-8e9e-0af8d7c92f7c
md"""
#### 10.3 
Use [LinearAlgebra.cross](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.cross) to compute the cross product of a vector v with itself and assign it to variable `cross_v`
"""

# ╔═╡ 2674c166-5e27-474e-9333-f6d377d5f3f7
@assert cross_v == [0, 0, 0]

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
# ╠═737a6b45-e15a-43ca-9199-47667f79330e
# ╠═bcf98e21-592a-4c4d-8d4f-b9b7bb89c91c
# ╠═ed70792f-8259-40fc-87a7-905070b5bacb
# ╠═b400dc72-5dbc-4d9b-81ad-855dd7b8695c
# ╠═743dc6a8-84a3-4e08-953a-fe22d39270cc
# ╠═1530c0cf-0c02-4f96-9c70-6b2c5b77e544
# ╠═7928fab8-9396-4ff3-9fea-ad4e6a79d641
# ╠═41c94f96-28f7-4dc6-aeaf-1018f2828931
# ╠═1ec5ef17-7527-4f79-af47-80cc9bbcd5ca
# ╠═3d311807-f2c3-45ed-b833-da53b8002277
# ╠═79b741f9-dab2-4bb7-be39-768a82cab798
# ╠═8e0aa890-885a-4aa7-87aa-a924e4504de3
# ╠═83a80d2f-babb-48e4-a22a-92ee8477c01a
# ╠═b3107d88-d17a-4ce6-950f-2365d3d3dddb
# ╠═b108bf6e-66aa-4213-90e9-c50d7593aa1d
# ╠═67f27e70-d720-4d74-acb4-674e61913286
# ╠═204e7b89-aea1-4af2-b08f-a36598287590
# ╠═f3520a30-aa30-435e-905b-a2f036cb9afc
# ╠═ff87f695-fc7a-4438-ab01-b6384bb8ac89
# ╠═d2f42464-8d25-4e76-9b7b-106e12f8d2d9
# ╠═828b67fb-ffcc-41ab-adec-06e55e299420
# ╠═d1afe106-fc52-4a38-9125-7b66b512b891
# ╠═cb1d26b9-8276-4c3a-8495-291bf3206aa9
# ╠═2aa68272-3d7b-4a4f-9882-f7bc9ac80012
# ╠═da3b800c-817e-4952-a11c-7f25f7c47429
# ╠═2037b0ab-ebd7-4021-a785-7e8103f67cba
# ╠═83f8eee4-a2e2-42b0-889a-69391c8de28d
# ╠═5462a70b-14ec-4190-9bf3-aad3d5ec655e
# ╠═e1593e12-4d3d-49a0-8561-8f348a20b1b4
# ╠═88725703-7f23-4535-aac5-f9957745c7e3
# ╠═9bd7daca-ee0f-4a31-8e9e-0af8d7c92f7c
# ╠═2674c166-5e27-474e-9333-f6d377d5f3f7
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
