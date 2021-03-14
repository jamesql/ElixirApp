defmodule CastleWeb.APIController do
  use CastleWeb, :controller

  alias Castle.Accounts

  def login(conn, params) do
    case params do
        %{"email" => email, "password" => password} -> # Regular API Call
            conn
            |> json(%{id: 123})
        %{"_csrf_token"=> t, "body"=> %{"email"=> email, "password"=> password}} -> # Browser Request
            conn
            |> json(%{id: 222})
        _ -> # Invalid Payload
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
