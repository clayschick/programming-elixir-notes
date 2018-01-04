defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts("Very cheap badge for #{name}")
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end

# iex(12)> c "defstruct1.exs"
# [Attendee]
# iex(13)> a1 = %Attendee{name: "Clay"}
# %Attendee{name: "Clay", over_18: true, paid: false}
# iex(14)> Attendee.may_attend_after_party(a1)
# false
# iex(15)> a2 = %Attendee{a1 | paid: true}
# %Attendee{name: "Clay", over_18: true, paid: true}
# iex(16)> Attendee.may_attend_after_party(a2)
# true