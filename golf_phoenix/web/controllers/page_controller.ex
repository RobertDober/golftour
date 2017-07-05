defmodule GolfPhoenix.PageController do
  use GolfPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
