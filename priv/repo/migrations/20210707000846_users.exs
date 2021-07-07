defmodule FirstAppV2.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :age, :integer

      timestamps();
    end
  end
end
