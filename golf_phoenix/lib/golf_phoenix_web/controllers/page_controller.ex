defmodule GolfPhoenixWeb.PageController do
  use GolfPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
