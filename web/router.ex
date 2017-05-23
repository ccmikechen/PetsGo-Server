defmodule Petsgo.Router do
  use Petsgo.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Petsgo do
    pipe_through :api
  end
end
