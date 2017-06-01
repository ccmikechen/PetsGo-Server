defmodule Petsgo.SessionView do
  use Petsgo.Web, :view

  def render("show.json", %{user: user, jwt: jwt}) do
    %{
      data: render_one(user, Petsgo.UserView, "user.json"),
      meta: %{token: jwt}
    }
  end

  def render("show_user.json", %{user: user}) do
    %{data: render_one(user, Petsgo.UserView, "user.json")}
  end

  def render("error.json", _) do
    %{error: "Invalid username or password"}
  end

  def render("delete.json", _) do
    %{ok: true}
  end

  def render("forbidden.json", %{error: error}) do
    %{error: error}
  end
end
