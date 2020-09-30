defmodule BiscoitoWeb.PageController do
  use BiscoitoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
