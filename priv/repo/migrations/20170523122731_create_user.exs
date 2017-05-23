defmodule Petsgo.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :sex, :string, null: false
      add :birthday, :date
      add :phone_number, :string
      add :image, :string

      timestamps()
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end
