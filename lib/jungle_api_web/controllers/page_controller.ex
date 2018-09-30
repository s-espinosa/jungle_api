defmodule JungleApiWeb.PageController do
  use JungleApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
