defmodule LiveviewTailwindDemoWeb.PageController do
  use LiveviewTailwindDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
