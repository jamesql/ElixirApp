defmodule CastleWeb.APIController do
  use CastleWeb, :controller

  def login(conn, params) do
    case params do
        %{"username" => username, "password" => password} -> 
            conn
            |> json(%{id: 123})
        _ ->
            conn 
            |> send_resp(400, "Invalid Payload.")
    end
  end

  def register(conn, _params) do
    f = 
        conn
        |> send_resp(200, "OK")
  end

end
