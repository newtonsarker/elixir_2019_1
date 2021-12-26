defmodule Elixir20191Web.PageController do
  use Elixir20191Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
