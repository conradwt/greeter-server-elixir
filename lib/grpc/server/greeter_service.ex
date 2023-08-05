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
      Protobuf.Builder.new(HelloResponse, message: message)
    else
      {:error, reason} ->
        Logger.info(reason)

        Protobuf.Builder.new(HelloResponse, [])

      _error ->
        Logger.info("Error completing request")

        Protobuf.Builder.new(HelloResponse, [])
    end
  end

  def start(port) do
    GRPC.Server.start(__MODULE__, port)
  end

  def stop(), do: GRPC.Server.stop(__MODULE__)
end
