defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)] # recursive call to self with tail as argument

  def add_one([]), do: []
  def add_one([head | tail]), do: [head + 1 | add_one(tail)] # recursive call to self with tail as argument

  # Keeping track of values during recursion
  # To keep things immutable just pass in an accumulator argument
  def sum([], total), do: total
  def sum([head | tail], total), do: sum(tail, head + total) # recursive call to self with tail as argument
  # Remember to pass in an initial value for the accumulator
  
  # Passing in the extra zero is crappy so the convention is to hide it.
  # Our module has a public function that takes just a list, and it calls private functions to do the work.
  def sum(list), do: _sum(list, 0)
  # Private functions
  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, head + total)

  # Another way to write sum without using an accumulator
  def sum1([]), do: 0
  def sum1([head | tail]), do: head + sum1(tail)
end

defmodule MyMap do
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)] # recursive call to self with tail as argument
  # MyMap.map [3,4,5] &(&1 + 1)
end

# Generalizing the sum function
# The sum function reduces a collection down to a single value. 
# We know it takes a collection and we know we have to pass in an initial accumulator value.
# Additionally we need to pass in a function that takes the current value of the reduction along with
# the next element in the collection, and returns the next value of the reduction.
# signature:
# -- reduce(collection, initial_value, fun)
# recursive logic:
# -- reduce([], value, _) -> value
# -- reduce([head | tail], value, fun) -> reduce(tail, fun.(head, value), fun)
defmodule MyReduce do
  def reduce([], value, _) do
    value
  end

  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
end

defmodule MapSum do
  def mapsum([], _), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)
end

defmodule MyMax do
  def max([x]), do: x
  def max([head | tail]), do: Kernel.max(head, max(tail))
end

defmodule MyCaesar do
  def caesar([], _), do: []
  def caesar([head | tail], n) when head + n <= ?z do
    [head + n | caesar(tail, n)]
  end
  def caesar([head | tail], n) do
    [head + n - 26 | caesar(tail, n)]
  end
end

defmodule MySpan do
  def span(from, to), do: _span(from, to, [])

  defp _span(to, to, list), do: [to | list]

  defp _span(from, to, _) when from > to, do: []

  defp _span(from, to, list) when from < to, do: _span(from, to - 1, [to | list])
end
