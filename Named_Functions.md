## Named Funtions

The functions body is a block.

Use the `do:` syntax for single-line blocks and `do ... end` for multiline ones

### Function Calls and Pattern Matching

When you call a named function, Elixir tries to match your arguments with the parameter list of the first definition (clause). If it cannot match them, it tries the next definition of the same function (remember, this must have the same arity) and checks to see if it matches. It continues until it runs out of candidates.

```elixir
defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end
```

Once the recursion ends Elixir unwinds the stack performing all the multiplications and returns the answer.

Can be optimixed with tail recursion.

This pattern of design and coding is very common in Elixir (and almost all functional languages). First look for the simplest possible case, one that has a definite answer. This will be the anchor. Then look for a recursive solution that will end up calling the anchor case.

Here are a couple of examples: 

Sum of the first n numbers 
- The sum of the first 0 numbers is 0. 
- The sum of the numbers up to _n_ is _n +_ the sum of the numbers up to _n-1_.

Length of a list
- The length of an empty list is 0.
- The length of any other list is 1 + the length of the tail of that list.

