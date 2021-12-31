defmodule Elixir20191.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Elixir20191.Products` context.
  """

  @doc """
  Generate a product_rating.
  """
  def product_rating_fixture(attrs \\ %{}) do
    {:ok, product_rating} =
      attrs
      |> Enum.into(%{
        product_name: "some product_name",
        quantity: 42
      })
      |> Elixir20191.Products.create_product_rating()

    product_rating
  end
end
