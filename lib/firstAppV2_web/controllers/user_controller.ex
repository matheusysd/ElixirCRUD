defmodule FirstAppV2Web.UserController do
  use FirstAppV2Web, :controller

  def get(conn, _params) do
    render(conn, "getUsers.json", %{data: "é isso ai"})
  end
end
