defmodule Elixir20191.Repo do
  use Ecto.Repo,
    otp_app: :elixir_2019_1,
    adapter: Ecto.Adapters.Postgres
end
