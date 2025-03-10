defmodule Aoc2016elixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :aoc2016elixir,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:parameterized_test, "~> 0.6", only: [:test]},
      {:arrays, ">= 2.1.1"}
    ]
  end
end
