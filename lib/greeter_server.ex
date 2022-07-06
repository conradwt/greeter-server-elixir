defmodule GreeterServer do
  @moduledoc """
  Documentation for `GreeterServer`.
  """

  @spec say_hello(String.t()) :: {:ok, String.t()} | {:error, any}
  def say_hello(name) when is_binary(name) do
    case String.length(name) > 0 do
      true ->
        {:ok, "Hello #{name}"}

      _error ->
        {:error, "String cannot be blank."}
    end
  end

  def say_hello(_name), do: {:error, "Invalid input."}
end
