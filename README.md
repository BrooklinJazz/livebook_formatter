# LivebookFormatter

A formatter for .livemd files.
## Installation

```elixir
def deps do
  [
    {:livebook_formatter, "~> 0.1.0", only: :dev, runtime: false}
  ]
end
```

## Usage

[HexDocs Documentation](https://hexdocs.pm/livebook_formatter)

You may either use the provided `LivebookFormatter.reformat/1` function to format the contents of a `.livemd` file,
or you can use the `mix format_livebooks` task which automatically formats all `.livemd` files within the current mix project.