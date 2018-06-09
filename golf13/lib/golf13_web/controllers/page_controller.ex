defmodule Golf13Web.PageController do
  use Golf13Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
