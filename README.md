# Cards

Basic commands

Terminal: `iex -S mix`

Reload terminal inside: `recompile`

Install dependencies: mix deps.get

dependencies: mix deps

location dependencies: mix.exs on deps function

update dependencies: mix deps.compile

docs: mix docs

run tests: mix test

maps: colors = %{red: "red", green: "green", blue: "blue"}

tuple: colors = [{:primary, "red"}, {:secondary, "green"}, {:tertiary, "blue"}]
       colors = [primary: "red", secondary: "green", tertiary: "blue"]

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cards` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cards, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/cards](https://hexdocs.pm/cards).

