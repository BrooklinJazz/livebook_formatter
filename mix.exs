defmodule LivebookFormatter.MixProject do
  use Mix.Project

  def project do
    [
      app: :livebook_formatter,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Formatter for .livemd files",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:livebook, "~> 0.7.2", only: :test, runtime: false},
      {:poison, "~> 5.0.0", only: :test},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:earmark, "~> 1.4"}
    ]
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/BrooklinJazz/livebook_formatter"}
    ]
  end
end
