defmodule Petsgo.PostType do
  use Petsgo.Web, :model

  schema "post_types" do
    field :type_name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:type_name])
    |> validate_required([:type_name])
  end
end
