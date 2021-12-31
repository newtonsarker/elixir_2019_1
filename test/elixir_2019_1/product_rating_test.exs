defmodule Elixir20191.ProductRatingTest do
  use Elixir20191.DataCase

  alias Elixir20191.ProductRating

  describe "products" do
    alias Elixir20191.ProductRating.Products

    import Elixir20191.ProductRatingFixtures

    @invalid_attrs %{product_name: nil, quantity: nil}

    test "list_products/0 returns all products" do
      products = products_fixture()
      assert ProductRating.list_products() == [products]
    end

    test "get_products!/1 returns the products with given id" do
      products = products_fixture()
      assert ProductRating.get_products!(products.id) == products
    end

    test "create_products/1 with valid data creates a products" do
      valid_attrs = %{product_name: "some product_name", quantity: 42}

      assert {:ok, %Products{} = products} = ProductRating.create_products(valid_attrs)
      assert products.product_name == "some product_name"
      assert products.quantity == 42
    end

    test "create_products/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProductRating.create_products(@invalid_attrs)
    end

    test "update_products/2 with valid data updates the products" do
      products = products_fixture()
      update_attrs = %{product_name: "some updated product_name", quantity: 43}

      assert {:ok, %Products{} = products} = ProductRating.update_products(products, update_attrs)
      assert products.product_name == "some updated product_name"
      assert products.quantity == 43
    end

    test "update_products/2 with invalid data returns error changeset" do
      products = products_fixture()
      assert {:error, %Ecto.Changeset{}} = ProductRating.update_products(products, @invalid_attrs)
      assert products == ProductRating.get_products!(products.id)
    end

    test "delete_products/1 deletes the products" do
      products = products_fixture()
      assert {:ok, %Products{}} = ProductRating.delete_products(products)
      assert_raise Ecto.NoResultsError, fn -> ProductRating.get_products!(products.id) end
    end

    test "change_products/1 returns a products changeset" do
      products = products_fixture()
      assert %Ecto.Changeset{} = ProductRating.change_products(products)
    end
  end
end
