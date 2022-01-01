defmodule Elixir20191.ProductRating.Products do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :product_name, :string
    field :quantity, :integer
    field :avg_rating, :decimal
    field :vote, :integer

    timestamps()
  end

  @doc false
  def changeset(products, attrs) do
    products
    |> cast(attrs, [:product_name, :quantity, :avg_rating, :vote])
    |> validate_required([:product_name, :quantity])
    |> unique_constraint([:product_name])
  end
end
