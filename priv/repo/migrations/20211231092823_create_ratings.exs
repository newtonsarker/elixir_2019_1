defmodule Elixir20191.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :user_email, :string, null: false
      add :score, :integer, null: false
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:ratings, [:product_id])
  end
end
