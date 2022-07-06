defmodule GreeterServer.GreeterService.Server do
  @moduledoc """
  Greeterapi Greeter Service Server.
  Test by going to greeter proto and running:
  `grpcurl -plaintext -proto greeterapi/greeter.proto -d '{"name": "Conrad"}' localhost:8080 greeterapi.GreeterService.SayHello`
  """
  use GRPC.Server, service: Greeterapi.GreeterService.Service

  alias Greeterapi.{
    HelloRequest,
    HelloResponse
  }

  require Logger

  def say_hello(%HelloRequest{name: name}, _stream) do
    with {:ok, message} <- GreeterServer.say_hello(name) do
      HelloResponse.new(message: message)
    else
      {:error, reason} ->
        Logger.info(reason)
        HelloResponse.new()

      _error ->
        Logger.info("Error completing request")
        HelloResponse.new()
    end
  end
end
