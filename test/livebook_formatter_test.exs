defmodule LivebookFormatterTest do
  use ExUnit.Case
  doctest LivebookFormatter

  test "format/1" do
    content = """
      # Heading

      ## SubHeading
      - bullet
      - bullet

      ```elixir
      2 + 2
        2 + 2
      ```
    """

    expected = Livebook.LiveMarkdown.MarkdownHelpers.reformat(content)
    actual = LivebookFormatter.reformat(content)
    assert actual == expected
  end
end
