defmodule FirstAppV2.Accounts do
  import Ecto.Query, warn: false
  alias FirstAppV2.Repo
  alias FirstAppV2.Accounts.User

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
end
