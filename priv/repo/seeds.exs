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
alias Elixir20191.Products.Product

[
  %{product_name: "Laptop HP-43", quantity: 25},
  %{product_name: "Amazing Pants", quantity: 10},
  %{product_name: "Good Pants", quantity: 0},
  %{product_name: "HeadPhones x25", quantity: 10},
]
|> Enum.map(fn product -> Product.changeset(%Product{}, product) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)