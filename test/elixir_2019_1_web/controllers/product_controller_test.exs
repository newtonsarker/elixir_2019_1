defmodule Elixir20191Web.ProductControllerTest do
  use Elixir20191Web.ConnCase

  import Elixir20191.ProductsFixtures

  @create_attrs %{product_name: "some product_name", quantity: 42}
  @update_attrs %{product_name: "some updated product_name", quantity: 43}
  @invalid_attrs %{product_name: nil, quantity: nil}

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :index))
      assert html_response(conn, 200) =~ "List of Products"
    end
  end

  defp create_product(_) do
    product = product_fixture()
    %{product: product}
  end
end
