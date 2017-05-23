defmodule Petsgo.UserController do
  use Petsgo.Web, :controller

  alias Petsgo.User

  def create(conn, params) do
    changeset = User.registration_changeset(%User{}, params)

    IO.inspect(changeset)

    case Repo.insert(changeset) do
      {:ok, user} ->
        new_conn = Guardian.Plug.api_sign_in(conn, user, :access)
        jwt = Guardian.Plug.current_token(new_conn)

        new_conn
        |> put_status(:created)
        |> render(Petsgo.SessionView, "show.json", user: user, jwt: jwt)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Petsgo.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
