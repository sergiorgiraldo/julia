### A Pluto.jl notebook ###
# v1.0.3

using Markdown
using InteractiveUtils

# ╔═╡ a1315840-8681-46f6-ba67-20e759e8823d
begin
	using Pkg
	Pkg.add("Plots")
	using Plots
end

# ╔═╡ 340e8753-2376-42f1-a42b-592bdfefd12a
begin
	Pkg.add("UnicodePlots")
	unicodeplots()
end

# ╔═╡ 7df5b1a8-8e24-4d10-b842-2db48905c20d
md"""
# Plotting

## Basics
There are a few different ways to plot in Julia (including calling PyPlot). <br>

Here we'll show you how to use `Plots.jl`.  If it's not installed yet, you need to use the package manager to install it, and Julia will precompile it for you the first time you use it:
"""

# ╔═╡ b8b692ee-71e7-4697-a0c3-58bc50ba3d3f
md"""
One of the advantages to `Plots.jl` is that it allows you to seamlessly change backends. In this notebook, we'll try out the `gr()` and `plotlyjs()` backends.<br>

In the name of scientific inquiry, let's use this notebook to examine the relationship between the global temperature and the number of pirates between roughly 1860 and 2000.
"""

# ╔═╡ ecbdd53c-c6da-4ccc-a4c2-1a7f6135e855
begin
	globaltemperatures = [14.4, 14.5, 14.8, 15.2, 15.5, 15.8]
	numpirates = [45000, 20000, 15000, 5000, 400, 17];
end

# ╔═╡ 634691b4-6e14-4360-9c4a-0a36ae82a958
md"""
Plots supports multiple backends — that is, libraries that actually do the drawing — all with the same API. To start out, let's try the GR backend.  You choose it with a call to `gr()`:
"""

# ╔═╡ faaa4217-a4c2-46fa-84c3-348cd052cfb5
gr()

# ╔═╡ f2799695-fdc7-4849-aabf-38556a48e02a
md"""
and now we can use commands like `plot` and `scatter` to generate plots.
"""

# ╔═╡ 84cd2219-18a7-4877-a099-a64c10255bf2
begin
	plot(numpirates, globaltemperatures, label="line")  
	scatter!(numpirates, globaltemperatures, label="points") 
end

# ╔═╡ e82dd994-9b38-4f69-aa2d-e082ffe9128c
md"""
The `!` at the end of the `scatter!` function name makes `scatter!` a mutating function, indicating that the scattered points will be added onto the pre-existing plot.

In contrast, see what happens when you replace `scatter!` in the above with the non-mutating function `scatter`.

Next, let's update this plot with the `xlabel!`, `ylabel!`, and `title!` commands to add more information to our plot.
"""

# ╔═╡ ebff3c7f-f824-437e-83f5-00e8a8b5c5ae
begin
	xlabel!("Number of Pirates [Approximate]")
	ylabel!("Global Temperature (C)")
	title!("Influence of pirate population on global warming")
end

# ╔═╡ acf6e6cd-55f2-4df8-a8ad-dbc6a51fb8e9
md"""
This still doesn't look quite right. The number of pirates has decreased since 1860, so reading the plot from left to right is like looking backwards in time rather than forwards. Let's flip the x axis to better see how pirate populations have caused global temperatures to change over time!
"""

# ╔═╡ 55d0e688-71ba-47e1-99a8-ba6a25a42f84
xflip!()

# ╔═╡ bdf14a41-4fd7-467d-8952-a1ed46636f4a
md"""
And there we have it!

Note: We've had some confusion about this exercise. :) This is a joke about how people often conflate correlation and causation.

**Without changing syntax, we can create this plot with the UnicodePlots backend**
"""

# ╔═╡ cfddafee-4929-411b-b64a-49e06deaef31
begin
	plot(numpirates, globaltemperatures, label="line")  
	scatter!(numpirates, globaltemperatures, label="points") 
	xlabel!("Number of Pirates [Approximate]")
	ylabel!("Global Temperature (C)")
	title!("Influence of pirate population on global warming")
end

# ╔═╡ dc4f70f5-0472-4c8d-bb78-e7338066eba2
md"""
And notice how this second plot differs from the first!  Using text like this is a little silly in a Jupyter notebook where we have fancy drawing capabilities, but it can be very useful for quick and dirty visualization in a terminal.
"""

# ╔═╡ 1715ff09-e5e4-4884-8c98-3904087aabe6
md"""
### Exercises

#### 8.1 
Given
```julia
x = -10:10
```
plot y vs. x for $y = x^2$.  You may want to change backends back again.
"""

# ╔═╡ 4f205d87-c07f-49d0-adbf-c5995d1f3f00
md"""
#### 8.2 
Execute the following code
"""

# ╔═╡ 3f9a574f-c3a1-4093-8dc2-a21e39ac4622
begin
	p1 = plot(x, x)
	p2 = plot(x, x.^2)
	p3 = plot(x, x.^3)
	p4 = plot(x, x.^4)
	plot(p1, p2, p3, p4, layout = (2, 2), legend = false)
end

# ╔═╡ 1e3c0eed-aa5f-4c24-a810-6a59cba0c6bf
md"""
and then create a $4x1$ plot that uses `p1`, `p2`, `p3`, and `p4` as subplots.
"""

# ╔═╡ Cell order:
# ╠═7df5b1a8-8e24-4d10-b842-2db48905c20d
# ╠═a1315840-8681-46f6-ba67-20e759e8823d
# ╠═b8b692ee-71e7-4697-a0c3-58bc50ba3d3f
# ╠═ecbdd53c-c6da-4ccc-a4c2-1a7f6135e855
# ╠═634691b4-6e14-4360-9c4a-0a36ae82a958
# ╠═faaa4217-a4c2-46fa-84c3-348cd052cfb5
# ╠═f2799695-fdc7-4849-aabf-38556a48e02a
# ╠═84cd2219-18a7-4877-a099-a64c10255bf2
# ╠═e82dd994-9b38-4f69-aa2d-e082ffe9128c
# ╠═ebff3c7f-f824-437e-83f5-00e8a8b5c5ae
# ╠═acf6e6cd-55f2-4df8-a8ad-dbc6a51fb8e9
# ╠═55d0e688-71ba-47e1-99a8-ba6a25a42f84
# ╠═bdf14a41-4fd7-467d-8952-a1ed46636f4a
# ╠═340e8753-2376-42f1-a42b-592bdfefd12a
# ╠═cfddafee-4929-411b-b64a-49e06deaef31
# ╠═dc4f70f5-0472-4c8d-bb78-e7338066eba2
# ╠═1715ff09-e5e4-4884-8c98-3904087aabe6
# ╠═4f205d87-c07f-49d0-adbf-c5995d1f3f00
# ╠═3f9a574f-c3a1-4093-8dc2-a21e39ac4622
# ╠═1e3c0eed-aa5f-4c24-a810-6a59cba0c6bf
