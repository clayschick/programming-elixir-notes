### Modules


Modules define namespaces for the things you define.

They also act as wrappers for macros, structs, protocols, and other modules.

If we want to reference a function defined in a module from outside that module, we need to prefix the reference with the module's name.

Module nesting in Elixir is an illusion - all modules are defined at the top level. When we define a module inside another, Elixir simply prepens the outer module name to the inner module name, putting a dot between the two.

This means that we can directly define a nested module.

```elixir
defmodule Mix.Tasks.Doctest do
  def run do
  end
end

Mix.Tasks.Doctest.run
```

It also means there's no particular relationship between the modules _Mix_ and _Mix.Tasks.Doctest_.

#### The _import_ directive

```elixir
import List, only: [flatten: 1, duplicate: 2]
```

You write **only:** or **except:**, followed by a list of **name: arity** pairs. It is a good idea to use _import_ in the smallest possible enclosing scope and to use _only:_ to import just the functions you need.

#### The _alias_ directive

```elixir
alias My.Other.Module.Parser, as: Parser
alias My.Other.Module.Runner, as: Runner
```

The **as:** is optional and will take the last part of the module name

```elixir
alias My.Other.Module.Parser
alias My.Other.Module.Runner
```

Can also do:

```elixir
alias My.Other.Module.{Parser, Runner}
```

The _require_ directive

Use is you want to use any macros a module defines. This ensures that the macro definitions are available when your code is compiled.

#### Module attributes

Elixir modules each have associated metadata. Each item of metadata is called an _attribute_ of the module and is defined by a name.

You give an attribute a value using the **@** syntax

`@name value`

This only works at the to level of a module - you can't set an attribute inside a functio definition.

You can, however, access attributes inside functions.

```elixir
defmodule Example do
  @attr "one"
  def first, do: @attr
  @attr "two"
  def second, do: @attr
end
IO.puts "#{Example.second}  #{Example.first}"    # => two  one
```

These attributes are not vaiables in the conventional sense. Use them for confiruration and metadata only (like constants)