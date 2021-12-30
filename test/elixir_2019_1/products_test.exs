defmodule Elixir20191.ProductsTest do
  use Elixir20191.DataCase

  alias Elixir20191.Products

  describe "products" do
    alias Elixir20191.Products.Product

    import Elixir20191.ProductsFixtures

    @invalid_attrs %{product_name: nil, quantity: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{product_name: "some product_name", quantity: 42}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.product_name == "some product_name"
      assert product.quantity == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{product_name: "some updated product_name", quantity: 43}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.product_name == "some updated product_name"
      assert product.quantity == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "ratings" do
    alias Elixir20191.Products.Rating

    import Elixir20191.ProductsFixtures

    @invalid_attrs %{score: nil, user_email: nil}

    test "list_ratings/0 returns all ratings" do
      product = product_fixture()
      rating = rating_fixture(%{product_id: product.id})
      assert Products.list_ratings() == [rating]
    end

    test "get_rating!/1 returns the rating with given id" do
      product = product_fixture()
      rating = rating_fixture(%{product_id: product.id})
      assert Products.get_rating!(rating.id) == rating
    end

    test "create_rating/1 with valid data creates a rating" do
      product = product_fixture()
      valid_attrs = %{product_id: product.id, score: 42, user_email: "some user_email"}

      assert {:ok, %Rating{} = rating} = Products.create_rating(valid_attrs)
      assert rating.score == 42
      assert rating.user_email == "some user_email"
    end

    test "create_rating/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_rating(@invalid_attrs)
    end

    test "update_rating/2 with valid data updates the rating" do
      product = product_fixture()
      rating = rating_fixture(%{product_id: product.id})
      update_attrs = %{score: 43, user_email: "some updated user_email"}

      assert {:ok, %Rating{} = rating} = Products.update_rating(rating, update_attrs)
      assert rating.score == 43
      assert rating.user_email == "some updated user_email"
    end

    test "update_rating/2 with invalid data returns error changeset" do
      product = product_fixture()
      rating = rating_fixture(%{product_id: product.id})
      assert {:error, %Ecto.Changeset{}} = Products.update_rating(rating, @invalid_attrs)
      assert rating == Products.get_rating!(rating.id)
    end

    test "delete_rating/1 deletes the rating" do
      product = product_fixture()
      rating = rating_fixture(%{product_id: product.id})
      assert {:ok, %Rating{}} = Products.delete_rating(rating)
      assert_raise Ecto.NoResultsError, fn -> Products.get_rating!(rating.id) end
    end

    test "change_rating/1 returns a rating changeset" do
      product = product_fixture()
      rating = rating_fixture(%{product_id: product.id})
      assert %Ecto.Changeset{} = Products.change_rating(rating)
    end
  end
end
