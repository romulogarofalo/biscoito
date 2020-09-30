defmodule Biscoito.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Comeonin.Bcrypt

  schema "users" do
    field :hashed_password, :string
    field :permissions, :map
    field :username, :string
    field :password, :string, virtual: true
    timestamps()
  end


  @required_attrs [:username, :password, :permissions]
  @spec changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint(:username)
    |> put_hashed_password()
  end

  defp put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :hashed_password, Bcrypt.hashpwsalt(password))
        _ ->
        changeset
      end
  end
end
