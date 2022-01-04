## Install Elixir
```shell 
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
sudo apt update
sudo apt install esl-erlang
sudo apt install elixir
```

## Install Phoenix
```shell
mix local.hex
elixir -v
mix archive.install hex phx_new
sudo apt install inotify-tools
```

## Install PostgreSQL
```shell
sudo apt install postgresql postgresql-contrib
sudo -u postgres psql postgres
\password postgres
sudo apt install postgresql-client
psql -h localhost postgres postgres
```

## Add BDD capabilities
Update ```mix.exs``` to include the dependencies
```elixir
def project do
   [
      ...
      preferred_cli_env: ["white_bread.run": :test],
      ...
   ]
end

defp deps do
   [
     ...
     {:white_bread, "~> 4.5", only: [:test]},
     {:hound, "~> 1.0"}
   ]
end
```
Run ```mix white_bread.run``` it will create a folder ```features``` and necessary configuration files

## Migrations Cheatsheet
```elixir
# create migration
mix ecto.gen.migration user

# run migrations
mix ecto.migrate
mix ecto.rollback

# populate with seeds
mix run priv/repo/seeds.exs

# create table
create table(:users) do
   add :user_name, :string, size: 50, default: "user name", null: false
   add :profile, :text
   add :age, :integer
   add :weight, :float
   add :height, :decimal, precision: 10, scale: 2
   add :org_id, references(:orgs)
   add :history, :json
   timestamps()  # inserted_at and updated_at
end
create index(:users, [:org_id])

# modify table
alter table(:users) do
   add :activity, :text
   modify :history, :text
   remove :age
end
rename table(:users), to: table(:system_user)
rename table(:users), :user_name, to: :user_profile_name

drop index(:users, [:org_id])
drop table(:users)
drop_if_exists table(:users)
```

## Phoenix Web
```elixir
# create new project
mix phx.new hello

# list all routes
mix phx.routes

# mvc works based on convention
# 1. lib/takso_web/router.ex
#    1. resources "/users", UserController
# 2. lib/takso_web/controllers/user_controller.ex
# 3. lib/takso_web/views/user_view.ex
# 4. lib/takso_web/templates/user ( a package for the ui templates )

# run bdd test
MIX_ENV=test mix white_bread.run
MIX_ENV=test mix app.bdd
```


### Scaffolding
```shell
# create new project
mix phx.new elixir_2019_1

# install dependencies
mix deps.get
mix deps.compile

# run phoenix server
mix phx.server

# create database ( config/dev[test].exs ) aliases are in mix.exs
MIX_ENV=test
mix ecto.reset

# create schema ( dto, manual is better )
mix phx.gen.schema Accounts.User users name

# command -> module -> template -> schema -> table -> fields
mix phx.gen.html ProductRating Products products product_name:string quantity:integer
mix phx.gen.html ProductRating Ratings ratings product_id:references:products user_email:string score:integer

mix phx.gen.context Products Rating ratings product_id:references:products user_email:string score:integer
mix phx.gen.html Ratings Rating ratings --no-context --no-schema
mix phx.gen.json Accounts User users name:string
mix phx.gen.live Accounts User users name:string


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

# testing
MIX_ENV=dev app.tdd
```

