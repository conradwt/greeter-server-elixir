defmodule GreeterServerTest do
  use ExUnit.Case
  doctest GreeterServer

  test "greets the world" do
    assert GreeterServer.hello() == :world
  end
end
