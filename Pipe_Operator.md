The **|>** operator takes the result of the expression to it's left and inserts it as the _first_ parameter of the function to it's right.

`val |> f(a,b)` is basically the same as calling `f(val,a,b)`

**You should always use parentheses around funtion parameters in pipelines.**

Programming is transforming data, and the |> operator makes that transformation explicit.

