defmodule Petsgo.PostView do
  use Petsgo.Web, :view

  alias Petsgo.Repo

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, Petsgo.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, Petsgo.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{type: type, user: user} =
      post
      |> Repo.preload(:type)
      |> Repo.preload(:user)

    %{
      id: post.id,
      type: type.type_name,
      user: %{
        username: user.username,
        image: user.image,
        first_name: user.first_name,
        last_name: user.last_name
      },
      title: post.title,
      content: post.content,
      inserted_at: post.inserted_at,
      updated_at: post.updated_at
    }
  end

  def render("new.json", %{post_id: post_id}) do
    %{
      result: %{
        status: "ok",
        post_id: post_id
      }
    }
  end
end
