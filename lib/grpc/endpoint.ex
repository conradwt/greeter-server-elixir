defmodule GreeterServer.Endpoint do
  use GRPC.Endpoint

  intercept GRPC.Server.Interceptors.Logger
  run GreeterServer.GreeterService.Server
end
