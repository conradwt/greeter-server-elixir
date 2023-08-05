# Greeter Server

The purpose of this repository is to create Greeter server
for responding to Greeter client requests.

## Starting the Greeter server

1. start an iex session

   ```zsh
   iex -S mix
   ```

2. start the Greet server by entering the following:

   ```elixir
   GreeterServer.GreeterService.Server.start(8080)
   ```

Note: The Greeter service is available on host, `localhost`, that has the port, `8080`.

## Stopping the Greeter server

1. start another iex session

   ```zsh
   iex -S mix
   ```

2. stop the Greeter server by entering the following:

   ```elixir
   GreeterServer.GreeterService.Server.stop()
   ```

## License

Greeter Server is released under the [MIT license](./LICENSE.md).

## Copyright

Copyright &copy; 2022 - 2023 Conrad Taylor. All rights reserved.
