defmodule Petsgo.Post do
  use Petsgo.Web, :model

  schema "posts" do
    field :title, :string
    field :content, :string
    belongs_to :type, Petsgo.PostType
    belongs_to :user, Petsgo.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :content, :user_id, :type_id])
    |> validate_required([:title, :content, :user_id, :type_id])
  end
end
