defmodule EventBusDemo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :event_bus_demo,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {EventBusDemo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gen_stage, "~> 0.14.0"},
      {:benchee, "~> 0.13.2", only: [:test, :dev]}
    ]
  end
end
