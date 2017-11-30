# With Expression
The **with** expression:

Defines a local scope for variables if you need a couple of temporary variables to calculate something:

[with expression scope](./with_expression_scope.exs)

Gives some control over pattern matching when using the **<-** operator:

```elixir
result  =  with {:ok, file}   =  File.open("/etc/passwd"),
                content       =  IO.read(file, :all),
                :ok           =  File.close(file),
                [_, uid, gid] <- Regex.run(~r/xxx:.*?:(\d+):(\d+)/, content)
           do
                "Group: #{gid}, User: #{uid}"
           end

IO.puts inspect(result)       #=> nil
```

[with expression pattern matching](./with_expression_pattern_match.exs)

NOTE: if a match fails it will return the value that could not be matched