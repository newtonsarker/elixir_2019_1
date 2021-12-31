defmodule Elixir20191.ProductRating.Ratings do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ratings" do
    field :score, :integer
    field :user_email, :string
    field :product_id, :id

    timestamps()
  end

  @doc false
  def changeset(ratings, attrs) do
    ratings
    |> cast(attrs, [:product_id, :user_email, :score])
    |> validate_required([:product_id, :user_email, :score])
  end
end
