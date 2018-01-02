defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(double(n))
end

defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end

defmodule Recursive do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
end

defmodule Maths do
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

# Factorial using a guard to prevent using a negative number
defmodule FactorialGaurd do
  def of(0), do: 1

  def of(n) when n > 0 do
    n * of(n - 1)
  end
end

defmodule Chop do
  def guess(actual, range = low..high) do
    # range is 1, 2, 3, 4, 5, 6
    guess = div(low + high, 2)
    IO.puts "Is it #{guess}"
    _guess(actual, guess, range)
  end

  defp _guess(actual, actual, _) do
    IO.puts "Yes, it's #{actual}"
  end

  defp _guess(actual, guess, _low..high) when actual > guess do
    guess(actual, guess + 1..high)
  end

  defp _guess(actual, guess, low.._high) when actual < guess do
    guess(actual, low..guess - 1)
  end
end