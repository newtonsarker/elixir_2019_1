# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Elixir20191.Repo.insert!(%Elixir20191.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Elixir20191.Repo
alias Elixir20191.ProductRating.Products
alias Elixir20191.ProductRating.Ratings

[
  %{product_name: "product_1", quantity: 5, avg_rating: 0, vote: 0},
  %{product_name: "product_2", quantity: 5, avg_rating: 0, vote: 0},
  %{product_name: "product_3", quantity: 5, avg_rating: 0, vote: 0},
  %{product_name: "product_4", quantity: 5, avg_rating: 0, vote: 0},
  %{product_name: "product_5", quantity: 5, avg_rating: 0, vote: 0}
]
|> Enum.map(fn product -> Products.changeset(%Products{}, product) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)
