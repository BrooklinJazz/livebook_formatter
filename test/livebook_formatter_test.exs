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

    # livebook automatically adds a new line when opened in the Livebook Application.
    expected = Livebook.LiveMarkdown.MarkdownHelpers.reformat(content) <> "\n"
    actual = LivebookFormatter.reformat(content)
    assert actual == expected
  end
end
