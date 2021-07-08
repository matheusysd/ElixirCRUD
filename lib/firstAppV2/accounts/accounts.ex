defmodule FirstAppV2.Accounts do
  import Ecto.Query, warn: false
  alias FirstAppV2.Repo #Uso do repo para fazer as querys
  alias FirstAppV2.Accounts.User #Instância(?) para mostrar qual schema está buscando (?)

  def get_users do
    Repo.all(User)
  end

  def create_user(params \\ %{}) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end

  def get_user(id) do
    Repo.get!(User, id)
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def update_user(%User{} = user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
