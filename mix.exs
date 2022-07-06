defmodule GreeterServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :greeter_server,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {GreeterServer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:greeter_proto, github: "conradwt/greeter-proto-elixir"}
    ]
  end
end
