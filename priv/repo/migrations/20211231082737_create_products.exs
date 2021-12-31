defmodule Elixir20191.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_name, :string, size: 50, null: false
      add :quantity, :integer, null: false

      timestamps()
    end
  end
end
