defmodule Petsgo.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :content, :string, null: false
      add :type_id, references(:post_types, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:posts, [:type_id])
    create index(:posts, [:user_id])
  end
end
