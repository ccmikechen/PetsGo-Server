defmodule Petsgo.PostChannel do
  use Petsgo.Web, :channel

  def join("post", _params, socket) do
    {:ok, %{}, socket}
  end

  def handle_in("new:post", _params, socket) do
    broadcast! socket, "new:post", %{}

    {:noreply, socket}
  end
end
