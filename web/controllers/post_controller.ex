defmodule Petsgo.PostController do
  use Petsgo.Web, :controller

  alias Petsgo.Post

  plug Guardian.Plug.EnsureAuthenticated, handler: Petsgo.SessionController

  def index(conn, _params) do
    posts = Repo.all(Post)
    render(conn, "index.json", posts: posts)
  end

  def create(conn, %{"title" => title, "content" => content, "type" => type}) do
    type_query =
      from u in "post_types",
      where: u.type_name == ^type,
      select: u.id
    [type_id] = Repo.all(type_query)
    current_user = Guardian.Plug.current_resource(conn)

    post = %{
      title: title,
      content: content,
      user_id: current_user.id,
      type_id: type_id
    }
    changeset = Post.changeset(%Post{}, post)

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_status(:created)
        |> render("show.json", post: post)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Petsgo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.json", post: post)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Repo.get!(Post, id)
    changeset = Post.changeset(post, post_params)

    case Repo.update(changeset) do
      {:ok, post} ->
        render(conn, "show.json", post: post)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Petsgo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(post)

    send_resp(conn, :no_content, "")
  end
end

