defmodule BlueskyHose.MixProject do
  use Mix.Project

  def project do
    [
      app: :bluesky_hose,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BlueskyHose.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.10"},
      {:websockex, "~> 0.4.3"},
      {:castore, "~> 1.0"},
      {:jason, "~> 1.4"}
    ]
  end
end
