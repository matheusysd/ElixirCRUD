defmodule FirstAppWeb.UserController do
  use FirstAppWeb, :controller
  import Plug.Conn
  alias FirstApp.Accounts
  alias FirstApp.Accounts.User

  def index(conn, _params) do
    users = Accounts.list_users()
    users_map = Enum.map(users, fn user -> Map.from_struct(user) end)
    users_name = Enum.map(users_map, fn user -> Map.take(user, [:name, :id, :age]) end)
    render(conn, "list.json", %{data: users_name})
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.user", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        user_map = Map.from_struct(user)
        user_id = Map.get(user_map, :id)
        render(conn, "create.json", %{response: user_id})

      {:error, %Ecto.Changeset{} = changeset} ->
        changeset_map = Map.from_struct(changeset)
        errors = Map.get(changeset_map, :errors)
        IO.inspect(errors)
        render(conn, "error.json", %{message: "Erro ao criar usuário"})
    end
  end

  def show(conn, %{"id" => id}) do
    # Estrutura User
    user = Accounts.get_user!(id)
    IO.inspect(user)
    # Transformando estrutura em map
    user_map = Map.from_struct(user)
    # Extraindo as chaves que quero usar
    user_info = Map.take(user_map, [:name, :id])
    IO.inspect(user_info)
    render(conn, "show.json", %{user: user_info})
  end

  def edit(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    changeset = Accounts.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        user_map = Map.from_struct(user)
        user_info = Map.take(user_map, [:id, :name])
        render(conn, "update.json", %{user: user_info})

      {:error, %Ecto.Changeset{} = changeset} ->
        # render(conn, "edit.html", user: user, changeset: changeset)
        render(conn, "error.json", %{message: "Erro ao atualizar usuário"})
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    case Accounts.delete_user(user) do
      {:ok, _user} ->
        user_map = Map.from_struct(user)
        user_id = Map.get(user_map, :id)
        send_resp(conn, 200, "{response: User #{user_id} deleted successfully.}")

      {:error, %Ecto.Changeset{} = changeset} ->
        # render(conn, "new.html", changeset: changeset)
        render(conn, "error.json", %{message: "Erro ao deletar usuário"})
    end
  end
end
