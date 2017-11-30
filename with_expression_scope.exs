content = "Now is the time"

clay = with {:ok, file} = File.open("/etc/passwd"),
            content = IO.read(file, :all),
            :ok = File.close(file),
            [_, uid, gid] = Regex.run(~r{clay:.*?:(\d+):(\d+)}, content)
       do
            "User: #{uid}, Group: #{gid}"
       end

IO.puts clay
IO.puts content

# The value of the with is the value of it's do parameter
# The inner variable 'content' does not effect the variable 'content' in the outer scope