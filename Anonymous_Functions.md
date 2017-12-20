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

