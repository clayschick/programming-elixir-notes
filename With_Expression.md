# With Expression
The **with **expression:  
Defines a local scope for variables if you need a couple of temporary variables to calculate something
```
content = "Now is the time"
        
lp = with {:ok, file}   = File.open("/etc/passwd"),
          content       = IO.read(file, :all),
          :ok           = File.close(file),
          [_, uid, gid] = Regex.run(~r/_lp:.*?:(\d+):(\d+)/, content)
     do
          "Group: #{gid}, User: #{uid}"
     end
        
IO.puts lp             #=> Group: 26, User: 26
IO.puts content        #=> Now is the time
```
  
Gives some control over pattern matching when using the **<-** operator.
        ```
        result  =  with {:ok, file}   =  File.open("/etc/passwd"),
                        content       =  IO.read(file, :all),
                        :ok           =  File.close(file),
                        [_, uid, gid] <- Regex.run(~r/xxx:.*?:(\d+):(\d+)/, content)
                   do
                        "Group: #{gid}, User: #{uid}"
                   end
        
        IO.puts inspect(result)       #=> nil
        ```
NOTE: if a match fails it will return the value that could not be matched