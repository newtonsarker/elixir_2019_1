defmodule Elixir20191.Repo.Migrations.ProductConstraint do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :avg_rating, :decimal, default: 0
      add :vote, :integer, default: 0
    end
    create unique_index(:products, [:product_name])
    create unique_index(:ratings, [:product_id, :user_email])
  end

end
