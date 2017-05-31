defmodule Petsgo.PostTypeTest do
  use Petsgo.ModelCase

  alias Petsgo.PostType

  @valid_attrs %{type_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PostType.changeset(%PostType{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PostType.changeset(%PostType{}, @invalid_attrs)
    refute changeset.valid?
  end
end
