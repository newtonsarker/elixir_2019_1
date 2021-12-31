defmodule Elixir20191Web.RatingsController do
  use Elixir20191Web, :controller

  alias Elixir20191.ProductRating
  alias Elixir20191.ProductRating.Ratings

  def index(conn, _params) do
    ratings = ProductRating.list_ratings()
    render(conn, "index.html", ratings: ratings)
  end

  def new(conn, _params) do
    changeset = ProductRating.change_ratings(%Ratings{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ratings" => ratings_params}) do
    case ProductRating.create_ratings(ratings_params) do
      {:ok, ratings} ->
        conn
        |> put_flash(:info, "Ratings created successfully.")
        |> redirect(to: Routes.ratings_path(conn, :show, ratings))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ratings = ProductRating.get_ratings!(id)
    render(conn, "show.html", ratings: ratings)
  end

  def edit(conn, %{"id" => id}) do
    ratings = ProductRating.get_ratings!(id)
    changeset = ProductRating.change_ratings(ratings)
    render(conn, "edit.html", ratings: ratings, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ratings" => ratings_params}) do
    ratings = ProductRating.get_ratings!(id)

    case ProductRating.update_ratings(ratings, ratings_params) do
      {:ok, ratings} ->
        conn
        |> put_flash(:info, "Ratings updated successfully.")
        |> redirect(to: Routes.ratings_path(conn, :show, ratings))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ratings: ratings, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ratings = ProductRating.get_ratings!(id)
    {:ok, _ratings} = ProductRating.delete_ratings(ratings)

    conn
    |> put_flash(:info, "Ratings deleted successfully.")
    |> redirect(to: Routes.ratings_path(conn, :index))
  end
end
