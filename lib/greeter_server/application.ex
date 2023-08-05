defmodule GreeterServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {GRPC.Server.Supervisor, endpoint: GreeterServer.Endpoint, port: 8080, start_server: false}
      # Starts a worker by calling: GreeterServer.Worker.start_link(arg)
      # {GreeterServer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GreeterServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
