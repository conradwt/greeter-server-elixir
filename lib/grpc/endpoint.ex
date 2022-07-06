defmodule GreeterServer.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Server.Logger)
  run(GreeterServer.GreeterService.Server)
end
