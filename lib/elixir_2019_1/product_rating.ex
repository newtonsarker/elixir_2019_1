defmodule Elixir20191.ProductRating do
  @moduledoc """
  The ProductRating context.
  """

  import Ecto.Query, warn: false
  alias Elixir20191.Repo

  alias Elixir20191.ProductRating.Products

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Products{}, ...]

  """
  def list_products do
    query = from(p in Products,
      select: p,
      order_by: [desc: p.avg_rating, asc: p.product_name],
    )
    sorted_products = Repo.all(query)

    # Repo.all(Products)
    sorted_products
  end

  @doc """
  Gets a single products.

  Raises `Ecto.NoResultsError` if the Products does not exist.

  ## Examples

      iex> get_products!(123)
      %Products{}

      iex> get_products!(456)
      ** (Ecto.NoResultsError)

  """
  def get_products!(id), do: Repo.get!(Products, id)

  @doc """
  Creates a products.

  ## Examples

      iex> create_products(%{field: value})
      {:ok, %Products{}}

      iex> create_products(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_products(attrs \\ %{}) do
    %Products{}
    |> Products.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a products.

  ## Examples

      iex> update_products(products, %{field: new_value})
      {:ok, %Products{}}

      iex> update_products(products, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_products(%Products{} = products, attrs) do
    products
    |> Products.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a products.

  ## Examples

      iex> delete_products(products)
      {:ok, %Products{}}

      iex> delete_products(products)
      {:error, %Ecto.Changeset{}}

  """
  def delete_products(%Products{} = products) do
    Repo.delete(products)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking products changes.

  ## Examples

      iex> change_products(products)
      %Ecto.Changeset{data: %Products{}}

  """
  def change_products(%Products{} = products, attrs \\ %{}) do
    Products.changeset(products, attrs)
  end

  alias Elixir20191.ProductRating.Ratings

  @doc """
  Returns the list of ratings.

  ## Examples

      iex> list_ratings()
      [%Ratings{}, ...]

  """
  def list_ratings do
    Repo.all(Ratings)
  end

  @doc """
  Gets a single ratings.

  Raises `Ecto.NoResultsError` if the Ratings does not exist.

  ## Examples

      iex> get_ratings!(123)
      %Ratings{}

      iex> get_ratings!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ratings!(id), do: Repo.get!(Ratings, id)

  @doc """
  Creates a ratings.

  ## Examples

      iex> create_ratings(%{field: value})
      {:ok, %Ratings{}}

      iex> create_ratings(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ratings(attrs \\ %{}) do
    rating = Ratings.changeset(%Ratings{}, attrs)
    updated_rating = Repo.insert(rating)

    case updated_rating do
      {:ok, urating} ->
        product_id = urating.product_id
        query = from(r in Ratings,
          group_by: r.product_id,
          having: r.product_id == ^product_id,
          select: %{product_id: r.product_id, vote: count(r.product_id), avg_rating: avg(r.score)}
        )
        rating_summary = Repo.one(query)
        product = get_products!(product_id)
        update_products(product, rating_summary)
      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect changeset
    end

    updated_rating
  end

  @doc """
  Updates a ratings.

  ## Examples

      iex> update_ratings(ratings, %{field: new_value})
      {:ok, %Ratings{}}

      iex> update_ratings(ratings, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ratings(%Ratings{} = ratings, attrs) do
    ratings
    |> Ratings.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ratings.

  ## Examples

      iex> delete_ratings(ratings)
      {:ok, %Ratings{}}

      iex> delete_ratings(ratings)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ratings(%Ratings{} = ratings) do
    Repo.delete(ratings)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ratings changes.

  ## Examples

      iex> change_ratings(ratings)
      %Ecto.Changeset{data: %Ratings{}}

  """
  def change_ratings(%Ratings{} = ratings, attrs \\ %{}) do
    Ratings.changeset(ratings, attrs)
  end
end
