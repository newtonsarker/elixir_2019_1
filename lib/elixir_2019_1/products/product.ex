defmodule Elixir20191.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :product_name, :string
    field :quantity, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:product_name, :quantity])
    |> validate_required([:product_name, :quantity])
  end
end
