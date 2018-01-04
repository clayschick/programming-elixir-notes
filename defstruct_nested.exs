defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

# iex(18)> c "defstruct_nested.exs"
# [BugReport, Customer]
# iex(19)> report = %BugReport{owner: %Customer{name: "Clay", company: "Simpli.fi"}, details: "shit is broke"}
# %BugReport{
#   details: "shit is broke",
#   owner: %Customer{company: "Simpli.fi", name: "Clay"},
#   severity: 1
# }

# iex(20)> report.owner.company
# "Simpli.fi"

# To update the nested struct use put_in() function

# iex(21)> put_in(report.owner.company, "Simplifi")
# %BugReport{
#   details: "shit is broke",
#   owner: %Customer{company: "Simplifi", name: "Clay"},
#   severity: 1
# }