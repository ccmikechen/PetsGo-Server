defmodule Petsgo.Repo.Migrations.CreatePostType do
  use Ecto.Migration

  def change do
    create table(:post_types) do
      add :type_name, :string, null: false

      timestamps()
    end

    create unique_index(:post_types, [:type_name])
  end
end
