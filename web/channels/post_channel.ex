defmodule Petsgo.PostChannel do
  use Petsgo.Web, :channel

  def join("post", _params, socket) do
    IO.puts "new connection"
    {:ok, %{}, socket}
  end

  def handle_in("new:post", _params, socket) do
    broadcast! socket, "new:post", %{}
    IO.puts "new:post"
    {:noreply, socket}
  end
end
