# The "|" join operator supports multiple values to its left.
# We could match multiple individual elements as the head.
# The function below swaps pairs of values
defmodule Swapper do
  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap([_]), do: raise("Can't swap a list with an odd number of elements")
end

# Suppose we have weather data in the format
#  [timestamp, location_id, temperature, rainfall]
# We want to report on the conditions for location number 27.
# Normally we would match into a variable called head but instead the head must itself be a four-element list, and
# the second element of the list must be 27. This function will execute only for entries from the desired location.
# The last line deals with all the other location information lists.
defmodule WeatherHistory do
  def for_location_27([]), do: []

  def for_location_27([[time, 27, temp, rain] | tail]) do
    [[time, 27, temp, rain] | for_location_27(tail)]
  end

  def for_location_27([_ | tail]), do: for_location_27(tail)

  # To make it generic just pass in the location.
  def for_location([], _target_loc), do: []

  # def for_location([[time, target_loc, temp, rain] | tail], target_loc) do
  #   [[time, target_loc, temp, rain] | for_location(tail, target_loc)]
  # end
  def for_location([head = [_, target_loc, _, _] | tail], target_loc) do
    [head | for_location(tail, target_loc)]
  end

  def for_location([_ | tail], target_loc), do: for_location(tail, target_loc)
end
