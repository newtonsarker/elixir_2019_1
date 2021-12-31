defmodule Elixir20191.ProductRatingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Elixir20191.ProductRating` context.
  """

  @doc """
  Generate a products.
  """
  def products_fixture(attrs \\ %{}) do
    {:ok, products} =
      attrs
      |> Enum.into(%{
        product_name: "some product_name",
        quantity: 42
      })
      |> Elixir20191.ProductRating.create_products()

    products
  end
end
