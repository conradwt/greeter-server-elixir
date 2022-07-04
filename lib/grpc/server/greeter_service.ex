defmodule GreeterServer.GreeterService.Server do
  @moduledoc """
  Greeterapi Greeter Service Server.
  Test by going to pokemon proto and running:
  `grpcurl -plaintext -proto greeterapi/greeter.proto -d '{"name": "Conrad"}' localhost:8080 greeter.GreeterService.SayHello`
  """
  use GRPC.Server, service: Gretterapi.GreeterService.Service

  alias Greeterapi.{
    HelloRequest,
    HelloResponse
  }

  require Logger

  def say_hello(%HelloRequest{name: name}, _stream) do
    with {:ok, message} when String.length(name) > 0  <- {:ok, message} do
      HelloResponse.new(message: message)
    else
      _error ->
        Logger.info("Error completing request")
        HelloResponse.new()
    end
  end
end
