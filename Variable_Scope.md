# Variable Scope
Elixir is lexically scoped.

The basic unit of scoping is the function body.

Modules define a scope for local variables, but these are only accessible at the top level of that module and not in the functions defined in the module.
 
Elixir structures that define their own scope:
* for
* in Comprehensions
* with expressions