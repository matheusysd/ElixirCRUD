defmodule FirstAppV2Web.UserController do
  use FirstAppV2Web, :controller

  alias FirstAppV2.Accounts

  def get_users(conn, _params) do
    users = Accounts.get_users()
    users_infos = Enum.map(users, fn user -> Map.take(user, [:name, :id, :age, :email]) end)
    render(conn, "show.json", list_users: users_infos)
  end

  def create_user(conn, params) do
    case Accounts.create_user(params) do
      {:ok, user} ->
        user_id = Map.get(user, :id)

        render(conn, "success.json", %{message: "Usuário criado com sucesso com o id: #{user_id}"})

      {:error, _error} ->
        render(conn, "error.json", %{message: "Erro ao criar usuário"})
    end
  end

  def get_user(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    user_info = Map.take(user, [:name, :id, :age, :email])
    render(conn, "show.json", user: user_info)
  end

  def delete_user(conn, %{"id" => id}) do
    user = Accounts.get_user(id)

    case Accounts.delete_user(user) do
      {:ok, _user} ->
        render(conn, "success.json", %{message: "Usuário deletado com sucesso."})

      {:error, _error} ->
        render(conn, "error.json", %{message: "Ocorreu um erro ao deletar o usuário."})
    end
  end

  def update_user(conn, %{"id" => id, "user" => new_user_params}) do
    user = Accounts.get_user(id)

    case Accounts.update_user(user, new_user_params) do
      {:ok, _user} ->
        render(conn, "success.json", %{message: "Usuário #{user.id} alterado com sucesso"})

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn."error.json", %{message: changeset})
    end
  end
end
