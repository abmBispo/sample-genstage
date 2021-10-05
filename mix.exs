defmodule SampleGenstage.MixProject do
  use Mix.Project

  def project do
    [
      app: :sample_genstage,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SampleGenstage.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gen_stage, "~> 1.0.0"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end
end
