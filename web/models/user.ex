defmodule Petsgo.User do
  use Petsgo.Web, :model

  @email_regex ~r/(\w+)@([\w.]+)/

  schema "users" do
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :first_name, :string
    field :last_name, :string
    field :sex, :string
    field :birthday, Ecto.Date
    field :phone_number, :string
    field :image, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :first_name, :last_name, :sex, :birthday, :email, :phone_number, :image])
    |> validate_required([:username, :email, :first_name, :last_name])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_length(:username, min: 8, max: 20)
    |> validate_format(:email, @email_regex)
  end

  def registration_changeset(struct, params) do
    struct
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_length(:password, min: 8, max: 100)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
