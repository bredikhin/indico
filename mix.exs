defmodule Indico.MixProject do
  use Mix.Project

  def project do
    [
      app: :indico,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp description do
    """
    Indico.io API wrapper
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Ruslan Bredikhin"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/bredikhin/indico",
        "Docs" => "https://hexdocs.pm/indico/"}
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
      {:tesla, "~> 1.0.0"},
      {:jason, ">= 1.0.0"}, # optional, required by JSON middleware
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:earmark, "~> 1.2", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5.1", only: :dev, runtime: false}
    ]
  end
end
