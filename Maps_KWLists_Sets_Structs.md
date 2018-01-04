### Maps, Keyword Lists, Sets, and Structs

A dictionary is a data type that associates keys and values.

How do we choose an appropriate dictionary type for a particular need?

Ask yourself these questions in this order:

1. Do I want to pattern-match against the contents (e.g. matching a dictionary that has a key of **:name** somewhere in it)?

_If so, use a map_

2. Will I want more than one entry with the same key?

_If so, you'll have to use the **Keyword** module_

3. Do I need to gaurantee the elements are ordered?

_If so, use the **Keyword** module_

4. If you've reached this point

_Use a map_

#### Pattern matching

You can't bind a value to a key during pattern matching. You can do this:

```
iex >  %{ 2 = > state } = %{ 1 = > ​: ok ​, 2 = > ​: error ​ }
%{ 1 = > ​: ok ​, 2 = > ​: error ​}
iex > state
: error
```

but not this:

```
iex > ​ %{ item = > :ok } = %{ 1 = > :ok, 2 = > :error } ​   
** (CompileError) iex: 5: illegal use of variable item in map key…
```

#### Updating a map

Maps let us add new key/ value entries and update existing entries without traversing the whole structure. But as with all values in Elixir, a map is immutable, and so the result of the update is a new map.

```elixir
new_map=%{old_map | key => value, ...}
```

That will only update an existing key. To add a new key you have to use the `Map.put_new/3` function.

#### Structs

Can pattern-match on type as well as content.

A struct is just a module that wraps a limited form of map. It's limited because the keys must be atoms and because these maps don't have _Dict_ capabilities.

```elixir
defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end
```

The name of the module is the name of the map type.

The _defstruct_ macro defines the struct's members.

Why are structs wrapped in a module? The idea is that you are likely to want to add struct-specific behavior.

See [defstruct1.exs](./defstruct1.exs)

Structs also play a large role when implementing polymorphism, which we will see in the _protocols_ chapter.

Structs can also be nested. See [defstruct_nested.exs](./defstruct_nested.exs)

To update a nested struct value use one of the dictionary-access functions, e.g. __put_in__

```
iex(21)> put_in(report.owner.company, "Simplifi")
%BugReport{
  details: "shit is broke",
  owner: %Customer{company: "Simplifi", name: "Clay"},
  severity: 1
}
```

The others are **update_in**, **get_in**, and **get_and_update_in** 

**update_in** lets you apply a function to a value in a structure

```
iex(22)> update_in(report.owner.name, &("Mr. " <> &1))
%BugReport{
  details: "shit is broke",
  owner: %Customer{company: "Simpli.fi", name: "Mr. Clay"},
  severity: 1
}
```

These also work for nested accessors to nonstructs. Just supply the keys as atoms:

```
iex> ​ report = %{ ​ owner: ​ %{ ​ name: ​ ​" ​ ​ Dave" ​, ​ company: ​ ​" ​ ​ Pragmatic" ​ }, ​ severity: ​ 1}
%{ owner: %{ company: "Pragmatic", name: "Dave"}, severity: 1}

iex> ​ put_in( report[ ​: owner ​][ ​: company ​], ​" ​ ​ PragProg" ​)
%{ owner: %{ company: "PragProg", name: "Dave"}, severity: 1}

iex> ​ update_in( report[ ​: owner ​][ ​: name ​], &( ​" ​ ​ Mr. "​ < > &1))
%{ owner: %{ company: "Pragmatic", name: "Mr. Dave"}, severity: 1}
```

There’s a cool trick that the dynamic versions of both **get_in** and **get_and_update_in** support — if you pass a function as a key, that function is invoked to return the corresponding values.