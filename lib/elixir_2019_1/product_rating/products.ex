defmodule Elixir20191.ProductRating.Products do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :product_name, :string
    field :quantity, :integer

    timestamps()
  end

  @doc false
  def changeset(products, attrs) do
    products
    |> cast(attrs, [:product_name, :quantity])
    |> validate_required([:product_name, :quantity])
  end
end
