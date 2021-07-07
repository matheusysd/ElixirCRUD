defmodule FirstAppV2.Accounts do
  import Ecto.Query, warn: false
  alias FirstAppV2.Repo
  alias FirstAppV2.Accounts.User

  def get_users do
    Repo.all(User)
  end
end
