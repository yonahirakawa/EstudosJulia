### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 8ebccb86-736d-4231-a4fc-8d700b5eec09
begin 
	using Pkg
	Pkg.activate(mktempdir())
	Pkg.add("Yao")
	Pkg.add("YaoPlots")
	Pkg.add("YaoExtensions")
end

# ╔═╡ ae7a496a-067e-45fe-9490-e904b4f7b2e2
using Yao, YaoPlots

# ╔═╡ ff6a97c6-fc65-474f-9816-fbe0ca6f5fae
x = 1

# ╔═╡ 261cb9e1-21ec-449a-8519-c82dffb3da39
x

# ╔═╡ c903c3e2-4a16-4255-9dae-8320af478329
typeof(x)

# ╔═╡ 86725c19-71a2-4c38-a81c-f9b98a0a8aef
[i for i in 1:10]

# ╔═╡ fdffd2cc-2a89-4e68-82e1-3fedaad53594
[(i, j) for i in 1:10, j in 1:5]

# ╔═╡ 6342dedd-ed47-4277-82c3-0d84a2d384cd
# Quantum Fourier transformation circuit

# ╔═╡ 2754f12c-2f0b-4782-93ba-b9f9b6f47f72
A(i, j) = control(i, j=>shift(2π/(1<<(i-j+1))))

# ╔═╡ 04b178c3-6b41-4c1b-9fe7-45ecaf3ce32d
B(n, k) = chain(n, j==k ? put(k=>H) : A(j, k) for j in k:n)

# ╔═╡ 7d1187b9-257f-41fe-a42f-3c84401b9202
qft(n) = chain(B(n, k) for k in 1:n)

# ╔═╡ 55dbc515-16b0-4969-b48e-0b5a95bb5060
plot(qft(3))

# ╔═╡ cfd39b33-2646-4ae0-9010-20ee7ca76197
# The chain function is used to chain two blocks of same size together
plot(chain(X, Y, H))

# ╔═╡ adbcd0fd-5930-4461-8dd5-cbf6b92a3d19
# The put function is used to put a gate on a specific location, it thus creates a larger block
plot(put(5, 2=>H))

# ╔═╡ 57ebf81b-5234-48c6-9ed0-fa5b5cd42467
# the control gates are defined using control block with another block as its input
# the 1st argument is the number of qubits
# the 2nd argument is the controlled gate and its location
plot(control(5, 3, 2=>H))

# ╔═╡ 1829e8e1-833b-43e0-9f71-40be26c1cb02
# the quantum blocks defined for a quantum circuit eventually form a tree-like structure, they are also printed in this way:

qft(3)

# ╔═╡ 976e39c5-0834-4036-a161-e92516783cf1
@doc ArrayReg

# ╔═╡ 93b67d1b-4b30-4b15-9b3f-e964a8cdf4b8


# ╔═╡ Cell order:
# ╠═ff6a97c6-fc65-474f-9816-fbe0ca6f5fae
# ╠═261cb9e1-21ec-449a-8519-c82dffb3da39
# ╠═c903c3e2-4a16-4255-9dae-8320af478329
# ╠═86725c19-71a2-4c38-a81c-f9b98a0a8aef
# ╠═fdffd2cc-2a89-4e68-82e1-3fedaad53594
# ╠═8ebccb86-736d-4231-a4fc-8d700b5eec09
# ╠═ae7a496a-067e-45fe-9490-e904b4f7b2e2
# ╠═6342dedd-ed47-4277-82c3-0d84a2d384cd
# ╠═2754f12c-2f0b-4782-93ba-b9f9b6f47f72
# ╠═04b178c3-6b41-4c1b-9fe7-45ecaf3ce32d
# ╠═7d1187b9-257f-41fe-a42f-3c84401b9202
# ╠═55dbc515-16b0-4969-b48e-0b5a95bb5060
# ╠═cfd39b33-2646-4ae0-9010-20ee7ca76197
# ╠═adbcd0fd-5930-4461-8dd5-cbf6b92a3d19
# ╠═57ebf81b-5234-48c6-9ed0-fa5b5cd42467
# ╠═1829e8e1-833b-43e0-9f71-40be26c1cb02
# ╠═976e39c5-0834-4036-a161-e92516783cf1
# ╠═93b67d1b-4b30-4b15-9b3f-e964a8cdf4b8
