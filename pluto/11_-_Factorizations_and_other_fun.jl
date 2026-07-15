### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ 5178fb65-5718-48ed-b5d2-7c06ce40f53c
begin
	using LinearAlgebra
	A = rand(3, 3)
	x = fill(1, (3,))
	b = A * x
end

# ╔═╡ 2b23a21d-1418-4e54-badd-249b49b90d46
md"""
# Factorizations and other fun
Based on work by Andreas Noack

## Outline
 - Factorizations
 - Special matrix structures
 - Generic linear algebra
"""

# ╔═╡ d1c3e7ff-97e0-49d8-bf7c-b9c4fe0b89cf
md"""
Before we get started, let's set up a linear system and use `LinearAlgebra` to bring in the factorizations and special matrix structures.
"""

# ╔═╡ 75e17462-d42d-4f40-b11e-159439678e6f
md"""
## Factorizations

#### LU factorizations
In Julia we can perform an LU factorization
```julia
PA = LU
``` 
where `P` is a permutation matrix, `L` is lower triangular unit diagonal and `U` is upper triangular, using `lufact`.

Julia allows computing the LU factorization and defines a composite factorization type for storing it.
"""

# ╔═╡ 465d318e-8e7c-4b68-bebc-6433055c2316
Alu = lu(A)

# ╔═╡ 83a9c32f-7fcd-4753-906d-632d79b0afcd
typeof(Alu)

# ╔═╡ ce49f6e4-e725-4478-aa12-f9e40818f4a8
md"""
The different parts of the factorization can be extracted by accessing their special properties
"""

# ╔═╡ 5bea576b-b8b8-40f0-bdf8-7959c5875207
Alu.P

# ╔═╡ 22724fe8-9f5b-498e-8d35-b0f66c0b9411
Alu.L

# ╔═╡ 90c8b9d2-c37a-4703-bc07-8ca8ba6b4f10
Alu.U

# ╔═╡ 776decbd-bd84-45c8-94eb-9bf247b52275
md"""
Julia can dispatch methods on factorization objects.

For example, we can solve the linear system using either the original matrix or the factorization object.
"""

# ╔═╡ 98de84db-bd2f-45f4-9577-412d5f8836aa
A\b

# ╔═╡ 43ce9854-f33e-4e16-8f36-31f014085de3
Alu\b

# ╔═╡ eaebe3c0-9c27-4b3b-951c-8971d1bc9f56
md"""
Similarly, we can calculate the determinant of `A` using either `A` or the factorization object
"""

# ╔═╡ f2687a8d-ad1f-4336-8563-375b8949b0c3
det(A) ≈ det(Alu)

# ╔═╡ 59312260-e5b9-4f6e-8728-37d42b366daf
md"""
#### QR factorizations

In Julia we can perform a QR factorization
```
A=QR
``` 

where `Q` is unitary/orthogonal and `R` is upper triangular, using `qrfact`. 
"""

# ╔═╡ fd1c04ef-6103-4b24-a828-4fd050834392
Aqr = qr(A)

# ╔═╡ 7c5b8f16-5b85-4cd9-8868-3ff272bf90de
md"""
Similarly to the LU factorization, the matrices `Q` and `R` can be extracted from the QR factorization object via
"""

# ╔═╡ 13b324be-e96e-40b4-b07f-e28a9651c1f1
Aqr.Q

# ╔═╡ 509489f1-26ee-4cc4-86ff-9b3efbe62b2d
Aqr.R

# ╔═╡ ce6d80f5-d2f1-4b56-9efc-d272faae73fb
md"""
#### Eigendecompositions
"""

# ╔═╡ 99d1ef62-d63a-4b2b-9e79-c2e23f1c2d15
md"""
The results from eigendecompositions, singular value decompositions, Hessenberg factorizations, and Schur decompositions are all stored in `Factorization` types.

The eigendecomposition can be computed
"""

# ╔═╡ 2a269f91-de8f-418b-b660-db4e86ca1e2a
begin
	Asym = A + A'
	AsymEig = eigen(Asym)
end

# ╔═╡ 4e15e0d8-0e43-4131-a1a5-801558945e0b
md"""
The values and the vectors can be extracted from the Eigen type by special indexing
"""

# ╔═╡ bc61be39-c29d-48ae-822b-2c1cb13ba467
AsymEig.values

# ╔═╡ 594e0367-d162-4c2a-bd22-f755c68c6319
AsymEig.vectors

# ╔═╡ c1139c45-0f35-42ba-9b2f-fca46e8bf6e5
md"""
Once again, when the factorization is stored in a type, we can dispatch on it and write specialized methods that exploit the properties of the factorization, e.g. that $A^{-1}=(V\Lambda V^{-1})^{-1}=V\Lambda^{-1}V^{-1}$.
"""

# ╔═╡ a7526517-7c61-4de9-b0cd-60877f4e8d60
inv(AsymEig)*Asym

# ╔═╡ 49bf2911-4df2-4da9-a39f-3c0d46725571
md"""
## Special matrix structures
Matrix structure is very important in linear algebra. To see *how* important it is, let's work with a larger linear system
"""

# ╔═╡ d9e22596-b5a8-468d-9878-9923772600dc
begin
	n = 1000
	A_2 = randn(n,n);
end

# ╔═╡ b39420bf-60f6-4cf8-9ac4-2afc6eccf389
md"""
Julia can often infer special matrix structure
"""

# ╔═╡ b5d60cde-3a7a-428b-952f-a400c6bb1e6b
begin
	Asym_2 = A_2 + A_2'
	issymmetric(Asym_2)
end

# ╔═╡ 5e851e25-14ea-4f5a-a6e8-b6ece0808daa
md"""
but sometimes floating point error might get in the way.
"""

# ╔═╡ fcd1a4e7-6927-473d-b49a-f6fd2d91323c
begin
	Asym_noisy = copy(Asym_2)
	Asym_noisy[1,2] += 5eps()
end

# ╔═╡ 5a92ec5a-c992-4198-9213-58ff26b5898b
issymmetric(Asym_noisy)

# ╔═╡ 63015163-81e7-4131-9819-3e50e21b23db
md"""
Luckily we can declare structure explicitly with, for example, `Diagonal`, `Triangular`, `Symmetric`, `Hermitian`, `Tridiagonal` and `SymTridiagonal`.
"""

# ╔═╡ 6735457e-8e23-45bb-9144-1564c3dd037a
Asym_explicit = Symmetric(Asym_noisy);

# ╔═╡ c0cbd61a-93ef-4df8-a80b-3fc32a6ae974
md"""
Let's compare how long it takes Julia to compute the eigenvalues of `Asym`, `Asym_noisy`, and `Asym_explicit`
"""

# ╔═╡ 29fd9aea-bbd1-46be-aa7a-4da7322b1c0b
@time eigvals(Asym);

# ╔═╡ 2163e745-3eaf-4830-8898-569bb16e9e55
@time eigvals(Asym_noisy);

# ╔═╡ c5f8957a-5ee3-4856-92cb-922c6c7a163b
@time eigvals(Asym_explicit);

# ╔═╡ d4ff01cb-7e3a-46d4-935d-ac69b4def8f4
md"""
In this example, using `Symmetric()` on `Asym_noisy` made our calculations about `5x` more efficient :)
"""

# ╔═╡ 2fc53d61-ee60-4ca1-ad30-8e17e412128a
md"""
#### A big problem
Using the `Tridiagonal` and `SymTridiagonal` types to store tridiagonal matrices makes it possible to work with potentially very large tridiagonal problems. The following problem would not be possible to solve on a laptop if the matrix had to be stored as a (dense) `Matrix` type.
"""

# ╔═╡ 0220afe9-7bbe-453b-81fd-8105607526c4
begin
	n_2 = 1_000_000;
	A_3 = SymTridiagonal(randn(n_2), randn(n_2-1));
	@time eigmax(A_3)
end

# ╔═╡ 2d85cb67-2612-46a4-9184-981b4ba95214
md"""
## Generic linear algebra
The usual way of adding support for numerical linear algebra is by wrapping BLAS and LAPACK subroutines. For matrices with elements of `Float32`, `Float64`, `Complex{Float32}` or `Complex{Float64}` this is also what Julia does.

However, Julia also supports generic linear algebra, allowing you to, for example, work with matrices and vectors of rational numbers.
"""

# ╔═╡ 08e63aad-5097-4a36-a6e1-4c6caedd2be8
md"""
#### Rational numbers
Julia has rational numbers built in. To construct a rational number, use double forward slashes:
"""

# ╔═╡ 90e351ef-3c78-47b1-affd-bc62377d587b
1//2

# ╔═╡ e293737c-a2e6-4cf9-94e0-79af0ae76105
md"""
#### Example: Rational linear system of equations
The following example shows how linear system of equations with rational elements can be solved without promoting to floating point element types. Overflow can easily become a problem when working with rational numbers so we use `BigInt`s.
"""

# ╔═╡ a8b430f8-480b-4f0a-877e-dfb101fd0f19
Arational = Matrix{Rational{BigInt}}(rand(1:10, 3, 3))/10

# ╔═╡ 9e022178-944e-41c9-80d7-10a630657dc8
begin
	x_2 = fill(1, 3)
	b_2 = Arational*x_2
end

# ╔═╡ 9679a18c-8f6b-40da-a8d3-38270585f95d
Arational\b_2

# ╔═╡ e3a98ad8-d62b-47d2-94ca-bc46be0a94de
lu(Arational)

# ╔═╡ 3ca1e40b-54e7-4d8b-b93b-c7a2b004e107
md"""
### Exercises

#### 11.1
What are the eigenvalues of matrix A?

```
A =
[
 140   97   74  168  131
  97  106   89  131   36
  74   89  152  144   71
 168  131  144   54  142
 131   36   71  142   36
]
```
and assign it a variable `A_eigv`
"""

# ╔═╡ b9bf8a6d-c72f-4c6d-97f5-2375ba6f8ff8


# ╔═╡ 8609c7ab-5af4-499a-9ae9-60bc7392ef27
@assert A_eigv ==  [-128.49322764802145, -55.887784553056875, 42.7521672793189, 87.16111477514521, 542.4677301466143]

# ╔═╡ dc3cc0b0-df06-4f7c-8af6-b7a4cabd2c60
md"""
#### 11.2 
Create a `Diagonal` matrix from the eigenvalues of `A`.
"""

# ╔═╡ 3c24256b-1fec-440a-8e8a-9ca4d1845e07
@assert A_diag ==  [-128.493    0.0      0.0      0.0       0.0;
    0.0    -55.8878   0.0      0.0       0.0;
    0.0      0.0     42.7522   0.0       0.0;
    0.0      0.0      0.0     87.1611    0.0;
    0.0 0.0      0.0      0.0     542.468]

# ╔═╡ 8a551610-0449-423b-9399-a4f1d0a06b96
md"""
#### 11.3 
Create a `LowerTriangular` matrix from `A` and store it in `A_lowertri`
"""

# ╔═╡ ec525561-23ea-43d6-89b6-dc285416aabe
@assert A_lowertri ==  [140    0    0    0   0;
  97  106    0    0   0;
  74   89  152    0   0;
 168  131  144   54   0;
 131   36   71  142  36]

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.6"
manifest_format = "2.0"
project_hash = "f352ceee806168c8ae38887a01d7bae6ca62470b"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.3.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.12.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.29+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.15.0+0"
"""

# ╔═╡ Cell order:
# ╠═2b23a21d-1418-4e54-badd-249b49b90d46
# ╠═d1c3e7ff-97e0-49d8-bf7c-b9c4fe0b89cf
# ╠═5178fb65-5718-48ed-b5d2-7c06ce40f53c
# ╠═75e17462-d42d-4f40-b11e-159439678e6f
# ╠═465d318e-8e7c-4b68-bebc-6433055c2316
# ╠═83a9c32f-7fcd-4753-906d-632d79b0afcd
# ╠═ce49f6e4-e725-4478-aa12-f9e40818f4a8
# ╠═5bea576b-b8b8-40f0-bdf8-7959c5875207
# ╠═22724fe8-9f5b-498e-8d35-b0f66c0b9411
# ╠═90c8b9d2-c37a-4703-bc07-8ca8ba6b4f10
# ╠═776decbd-bd84-45c8-94eb-9bf247b52275
# ╠═98de84db-bd2f-45f4-9577-412d5f8836aa
# ╠═43ce9854-f33e-4e16-8f36-31f014085de3
# ╠═eaebe3c0-9c27-4b3b-951c-8971d1bc9f56
# ╠═f2687a8d-ad1f-4336-8563-375b8949b0c3
# ╠═59312260-e5b9-4f6e-8728-37d42b366daf
# ╠═fd1c04ef-6103-4b24-a828-4fd050834392
# ╠═7c5b8f16-5b85-4cd9-8868-3ff272bf90de
# ╠═13b324be-e96e-40b4-b07f-e28a9651c1f1
# ╠═509489f1-26ee-4cc4-86ff-9b3efbe62b2d
# ╠═ce6d80f5-d2f1-4b56-9efc-d272faae73fb
# ╠═99d1ef62-d63a-4b2b-9e79-c2e23f1c2d15
# ╠═2a269f91-de8f-418b-b660-db4e86ca1e2a
# ╠═4e15e0d8-0e43-4131-a1a5-801558945e0b
# ╠═bc61be39-c29d-48ae-822b-2c1cb13ba467
# ╠═594e0367-d162-4c2a-bd22-f755c68c6319
# ╠═c1139c45-0f35-42ba-9b2f-fca46e8bf6e5
# ╠═a7526517-7c61-4de9-b0cd-60877f4e8d60
# ╠═49bf2911-4df2-4da9-a39f-3c0d46725571
# ╠═d9e22596-b5a8-468d-9878-9923772600dc
# ╠═b39420bf-60f6-4cf8-9ac4-2afc6eccf389
# ╠═b5d60cde-3a7a-428b-952f-a400c6bb1e6b
# ╠═5e851e25-14ea-4f5a-a6e8-b6ece0808daa
# ╠═fcd1a4e7-6927-473d-b49a-f6fd2d91323c
# ╠═5a92ec5a-c992-4198-9213-58ff26b5898b
# ╠═63015163-81e7-4131-9819-3e50e21b23db
# ╠═6735457e-8e23-45bb-9144-1564c3dd037a
# ╠═c0cbd61a-93ef-4df8-a80b-3fc32a6ae974
# ╠═29fd9aea-bbd1-46be-aa7a-4da7322b1c0b
# ╠═2163e745-3eaf-4830-8898-569bb16e9e55
# ╠═c5f8957a-5ee3-4856-92cb-922c6c7a163b
# ╠═d4ff01cb-7e3a-46d4-935d-ac69b4def8f4
# ╠═2fc53d61-ee60-4ca1-ad30-8e17e412128a
# ╠═0220afe9-7bbe-453b-81fd-8105607526c4
# ╠═2d85cb67-2612-46a4-9184-981b4ba95214
# ╠═08e63aad-5097-4a36-a6e1-4c6caedd2be8
# ╠═90e351ef-3c78-47b1-affd-bc62377d587b
# ╠═e293737c-a2e6-4cf9-94e0-79af0ae76105
# ╠═a8b430f8-480b-4f0a-877e-dfb101fd0f19
# ╠═9e022178-944e-41c9-80d7-10a630657dc8
# ╠═9679a18c-8f6b-40da-a8d3-38270585f95d
# ╠═e3a98ad8-d62b-47d2-94ca-bc46be0a94de
# ╠═3ca1e40b-54e7-4d8b-b93b-c7a2b004e107
# ╠═b9bf8a6d-c72f-4c6d-97f5-2375ba6f8ff8
# ╠═8609c7ab-5af4-499a-9ae9-60bc7392ef27
# ╠═dc3cc0b0-df06-4f7c-8af6-b7a4cabd2c60
# ╠═3c24256b-1fec-440a-8e8a-9ca4d1845e07
# ╠═8a551610-0449-423b-9399-a4f1d0a06b96
# ╠═ec525561-23ea-43d6-89b6-dc285416aabe
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
