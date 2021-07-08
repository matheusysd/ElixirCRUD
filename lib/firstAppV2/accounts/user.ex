defmodule FirstAppV2.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, except: [:__meta__]} #Jason evita o uso de Map.from_struct
  schema "users" do #Criação de campos
    field :name, :string #campo, nome do campo, tipo do campo
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
