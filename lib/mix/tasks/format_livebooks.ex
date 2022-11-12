defmodule Mix.Tasks.FormatLivebooks do
  @moduledoc "Format Livebooks"
  @shortdoc @moduledoc
  @ignored_folders ["deps", "_build", ".elixir_ls"]

  use Mix.Task

  def run(_) do
    get_nested_livebooks()
    |> Enum.map(fn livemd ->
      formatted_content =
        File.read!(livemd)
        |> LivebookFormatter.reformat()

      File.write!(livemd, formatted_content)
    end)
  end

  @spec get_nested_livebooks(String.t()) :: [String.t()]
  defp get_nested_livebooks(path \\ "./") do
    File.ls!(path)
    |> Kernel.--(@ignored_folders)
    |> Enum.map(fn file_or_dir ->
      full_path = Path.join(path, file_or_dir)

      if File.dir?(full_path) do
        get_nested_livebooks(full_path)
      else
        full_path
      end
    end)
    |> List.flatten()
    |> Enum.filter(&String.ends_with?(&1, ".livemd"))
  end
end
