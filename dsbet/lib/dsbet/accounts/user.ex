defmodule DSBet.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :token, :string
    field :username, :string
    field :provider, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :provider, :token, :username])
    |> validate_required([:email, :provider, :token, :username])
    |> unique_constraint(:email)
  end
end
