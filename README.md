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
sudo apt install inotify-tools
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

# install dependencies
mix deps.get

# run phoenix server
mix phx.server
mix deps.compile

# create database ( config/dev[test].exs ) aliases are in mix.exs
MIX_ENV=test
mix ecto.reset

# create migration
mix ecto.gen.migration user

# run migrations
mix ecto.migrate

# populate with seeds
mix run priv/repo/seeds.exs

# create schema ( dto, manual is better )
mix phx.gen.schema Accounts.User users name

# command -> template -> module -> schema -> table -> fields
mix phx.gen.html Products Product products product_name:string quantity:integer

# run mix 
iex -S mix
recompile()

# try services in console
alias Takso.Dao.Service.UserService
UserService.list_users()
UserService.create_user(%{"name" => "bang bang", "username" => "tango", "password" => "bingo"})
UserService.update_user(3, %{"name" => "bang bang x", "username" => "tangox", "password" => "bingox"})
UserService.delete_user(3)

# start dev server ( default: http://localhost:4000 )
mix phx.server

```


## list all routes
mix phx.routes

## mvc works based on convention
1. lib/takso_web/router.ex
    1. resources "/users", UserController
2. lib/takso_web/controllers/user_controller.ex
3. lib/takso_web/views/user_view.ex
4. lib/takso_web/templates/user ( a package for the ui templates )


## run bdd test
mix white_bread.run



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
