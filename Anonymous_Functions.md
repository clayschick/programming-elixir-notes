### Anonymous functions

At it's simplist, a function has a parameter list and a body, seperated by a **->**

```elixir
fn ​ ​   
  parameter-list -> body ​   
  parameter-list -> body ... ​   ​ 
end
```

```
iex(1)> sum = fn (a, b) -> a + b end
#Function<12.99386804/2 in :erl_eval.expr/5>
iex(2)> sum.(1,3)
4
```

Notice that the dot indicates the function call

When calling sum.(1,3) the _1_ and the _3_ are not assigned to the variable _a_ and _b_ but are pattern matched. Elixir does not have assignment.


### Functions that return functions

Functions that return functions can have a closure. The scope encloses the bindings of its variables, packaging them into something that can be saved and used later.

```
iex(1)> prefix = fn prefix -> fn name -> "#{prefix} #{name}"  end end
#Function<6.99386804/1 in :erl_eval.expr/5>
iex(2)> mrs = prefix.("Mrs")
#Function<6.99386804/1 in :erl_eval.expr/5>
iex(3)> mrs.("Jones")
"Mrs Jones"
```

Notice in the example above that the prefix is the first parameter that gets set and therefore has to be _matched_ on the first function call. Then the inner function is returned with the _prefix_ param set and waiting for the _name_ argument to be matched.

The closure value can be _pinned_ so that it does not change:

```elixir
defmodule Greeter do
  def for(name, greeting) do
    fn
      ^name -> "#{greeting} #{name}"
      _ -> "I don't know you"
    end
  end
end
```

### Passing functions as arguments

Think of a _map_ function


### The & Notation

The & operator converts the expression that follows into a function. Inside that expression, the placeholders &1, &2, and so on correspond to the first, second, and subsequent parameters of the function.

```
iex(1)> add_one = &(&1 + 1)
#Function<6.99386804/1 in :erl_eval.expr/5>
iex(2)> add_one.(44)
45
iex(3)> speak = &(IO.puts(&1))
&IO.puts/1
iex(4)> speak.("hello")
hello
:ok
```

Look at the speak line in the previous code. Normally Elixir would have generated an anonymous function, so `&( IO.puts(& 1))` would become `fn x -> IO.puts( x) end`. But Elixir noticed that the body of the anonymous function was simply a call to a named function (the IO function puts) and that the parameters were in the correct order (that is, the first parameter to the anonymous function was the first parameter to the named function, and so on). So Elixir optimized away the anonymous function, replacing it with a direct reference to the function, `IO.puts/1`.

For this to work, thr arguments must be in the correct order.

Because [] and {} are operators in Elixir, literal lists and tuples can also be turned into functions.

```
iex(1)> divrem = &{ div(&1, &2), rem(&1, &2) }
#Function<12.99386804/2 in :erl_eval.expr/5>
iex(2)> divrem.(13, 5)
{2, 3}
```

There’s a second form of the & function capture operator. You can give it the name and arity (number of parameters) of an existing function, and it will return an anonymous function that calls it. The arguments you pass to the anonymous function will in turn be passed to the named function. We’ve already seen this: when we entered &( IO.puts(& 1)) into iex, it displayed the result as &IO.puts/ 1. In this case, puts is a function in the IO module, and it takes one argument. The Elixir way of naming this is IO.puts/ 1. If we place an & in front of this, we wrap it in a function.

```
iex(4)> l = &length/1
&:erlang.length/1
iex(5)> l.([1,2,3,4,5])
5

iex(6)> len = &Enum.count/1
&Enum.count/1
iex(7)> len.([1,2,3,4,5])
5
```

The **&** notation makes it easy to pass a function to another function
