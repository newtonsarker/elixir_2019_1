### Install Elixir
```shell 
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
sudo apt update
sudo apt install esl-erlang
sudo apt install elixir
```

### Install Phoenix
```shell
mix local.hex
elixir -v
mix archive.install hex phx_new
```

### Install PostgreSQL
```shell
sudo apt install postgresql postgresql-contrib
sudo -u postgres psql postgres
\password postgres
sudo apt install postgresql-client
psql -h localhost postgres postgres
```

### Scafolding
```shell
# create new project
mix phx.new elixir_2019_1
```






# Elixir20191

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
