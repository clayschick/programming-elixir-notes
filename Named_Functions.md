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

### Guard Clauses

Pattern matching allows Elixir to decide which function to invoke based on the argument passed in but if we can use guards to distinguish based on argument type or on some test of the argument value.

These are predicates that are attached to a function definition using one or more **when** keywords.

Clauses are limited to:

Comparison operators
- **==, !=, ===, !==, >, <, >=, <=**

Boolean and negation operators
- **or, and, not, !** Note that **||** and **&&** are not allowed.

Arithmetic operators
- __+, -, *, /__

Join operators
- **<>** and **++**, as long as the left side is a literal

The __in__ operator
- membership in a collection or range

Type-check functions
- **is_atom is_binary is_bitstring is_boolean is_exception is_float is_function is_integer is_list is_map is_number is_pid is_port is_record is_reference is_tuple**

Other funtions
- **abs( number) bit_size( bitstring) byte_size( bitstring) div( number, number) elem( tuple, n) float( term) hd( list) length( list) node() node( pid | ref | port) rem( number, number) round( number) self() tl( list) trunc( number) tuple_size( tuple)**