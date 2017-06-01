defmodule Petsgo.Router do
  use Petsgo.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/.well-known", Petsgo do
    get "/acme-challenge/:challenge", AcmeChallengeController, :show
  end

  scope "/api", Petsgo do
    pipe_through :api

    post "/sessions", SessionController, :create
    delete "/sessions", SessionController, :delete
    post "/sessions/refresh", SessionController, :refresh
    get "/sessions/user", SessionController, :show_user

    resources "/users", UserController, only: [:create]

    resources "/posts", PostController, only: [:create, :index, :show, :update]
  end
end
