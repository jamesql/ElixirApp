defmodule CastleWeb.SktChannel do
  use CastleWeb, :channel

  @impl true
  def join("skt:lobby", payload, socket) do
    if authorized?(payload) do
      send(self, :after_join)
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (skt:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Handle Newly Connected Sockets
  # Send a Hello Packet with HeartBeat Interval
  def handle_info(:after_join, socket) do
    push(socket, "HELLO", %{heartbeatInterval: "3e5"})
    {:noreply, socket} 
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
