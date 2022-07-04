defmodule GreeterServer.Endpoint do
  user(GRPC.Endpoint)

  intercept(GRPC.Server.Logger)
  run(GreeterServer.GreeterService.Server)
end
