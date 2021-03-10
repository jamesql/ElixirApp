defmodule CastleWeb.SktChannel do
  use CastleWeb, :channel

  @impl true
  def join("skt:lobby", payload, socket) do
    if authorized?(payload) do
      send(self(), :after_join)
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # HELLO_ACK
  # Hello Acknowledgement, aka first heartbeat
  # since auth is handled in join we no longer need a AUTH code
  def handle_in("HELLO_ACK", payload, socket) do
    push(socket, "READY", %{})
    {:noreply, socket}
  end

  # HEARTBEAT
  # Checks on the status of the client
  def handle_in("HEARTBEAT", payload, socket) do
    push(socket, "HEARTBEAT_ACK", %{})
    {:noreply, socket}
  end

  # Handle Newly Connected Sockets
  # Send a Hello Packet with HeartBeat Interval
  def handle_info(:after_join, socket) do
    push(socket, "HELLO", %{heartbeatInterval: "3e4"})
    {:noreply, socket} 
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
