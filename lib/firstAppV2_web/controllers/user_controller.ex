defmodule FirstAppV2Web.UserController do
  use FirstAppV2Web, :controller


  alias FirstAppV2.Accounts

  def get(conn, _params) do
    users = Accounts.get_users()
    IO.inspect(users)
    render(conn, "getUsers.json", %{data: "é isso ai"})
  end

  def post(conn, params) do
    case Accounts.create_user(params) do
      {:ok, user} ->
        user_map = Map.from_struct(user)
        user_id = Map.get(user_map, :id)
        render(conn, "success.json", %{message: "Usuário criado com sucesso com o id: #{user_id}"})
      {:error, error} ->
        error_map = Map.from_struct(error)
        error_message = Map.get(error_map, :errors)
        IO.inspect(error_message)
        render(conn, "error.json", %{message: "Erro ao criar usuário"})
    end
  end
end
