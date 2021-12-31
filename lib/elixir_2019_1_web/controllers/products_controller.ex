defmodule Elixir20191Web.ProductsController do
  use Elixir20191Web, :controller

  alias Elixir20191.ProductRating
  alias Elixir20191.ProductRating.Products

  def index(conn, _params) do
    products = ProductRating.list_products()
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = ProductRating.change_products(%Products{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"products" => products_params}) do
    case ProductRating.create_products(products_params) do
      {:ok, products} ->
        conn
        |> put_flash(:info, "Products created successfully.")
        |> redirect(to: Routes.products_path(conn, :show, products))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    products = ProductRating.get_products!(id)
    render(conn, "show.html", products: products)
  end

  def edit(conn, %{"id" => id}) do
    products = ProductRating.get_products!(id)
    changeset = ProductRating.change_products(products)
    render(conn, "edit.html", products: products, changeset: changeset)
  end

  def update(conn, %{"id" => id, "products" => products_params}) do
    products = ProductRating.get_products!(id)

    case ProductRating.update_products(products, products_params) do
      {:ok, products} ->
        conn
        |> put_flash(:info, "Products updated successfully.")
        |> redirect(to: Routes.products_path(conn, :show, products))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", products: products, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    products = ProductRating.get_products!(id)
    {:ok, _products} = ProductRating.delete_products(products)

    conn
    |> put_flash(:info, "Products deleted successfully.")
    |> redirect(to: Routes.products_path(conn, :index))
  end
end
