defmodule ISS.PageController do
  use ISS.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
