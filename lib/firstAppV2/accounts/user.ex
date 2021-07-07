defmodule FirstAppV2.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "users" do
    field :name, :string
    field :email, :string
    field :age, :integer
    timestamps()
  end
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :age])
    |> validate_required([:name, :email, :age])
  end
end
