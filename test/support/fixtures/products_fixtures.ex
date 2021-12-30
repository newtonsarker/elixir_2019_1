defmodule Elixir20191.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Elixir20191.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        product_name: "some product_name",
        quantity: 42
      })
      |> Elixir20191.Products.create_product()

    product
  end

  @doc """
  Generate a rating.
  """
  def rating_fixture(attrs \\ %{}) do
    {:ok, rating} =
      attrs
      |> Enum.into(%{
        score: 42,
        user_email: "some user_email"
      })
      |> Elixir20191.Products.create_rating()

    rating
  end
end
