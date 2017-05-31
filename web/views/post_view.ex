defmodule Petsgo.PostView do
  use Petsgo.Web, :view

  alias Petsgo.Repo
  alias Petsgo.PostType
  alias Petsgo.User

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, Petsgo.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, Petsgo.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{type_name: type} = Repo.get(PostType, post.type_id)
    user = Repo.get(User, post.user_id)

    %{
      id: post.id,
      type: type,
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
end
