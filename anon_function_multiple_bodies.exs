handle_open = fn
  {:ok, file} -> "First line: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts(handle_open.(File.open("tester.txt")))

IO.puts(handle_open.(File.open("fakefile.txt")))

fizz_buzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

IO.puts(fizz_buzz.(0, 0, 3))
IO.puts(fizz_buzz.(0, 2, 2))
IO.puts(fizz_buzz.(1, 0, 3))
IO.puts(fizz_buzz.(1, 1, 1))

remainder = fn n ->
  fizz_buzz.(rem(n, 3), rem(n, 5), n)
end

IO.puts(remainder.(10))
IO.puts(remainder.(11))
IO.puts(remainder.(12))
IO.puts(remainder.(13))
IO.puts(remainder.(14))
IO.puts(remainder.(15))
IO.puts(remainder.(16))

defmodule Greeter do
  def for(name, greeting) do
    fn
      ^name -> "#{greeting} #{name}"
      _ -> "I don't know you"
    end
  end
end

hey_clay = Greeter.for("Clay", "Hey,")

IO.puts(hey_clay.("Clay"))
IO.puts(hey_clay.("Jason"))
