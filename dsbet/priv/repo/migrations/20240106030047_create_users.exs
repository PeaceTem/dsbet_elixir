defmodule DSBet.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    drop table(:users)

    create table(:users) do
      add :email, :string
      add :provider, :string
      add :token, :string
      add :username, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:email])
  end
end
