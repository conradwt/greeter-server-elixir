defmodule GreeterServer.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(GreeterServer.GreeterService.Server)
end
