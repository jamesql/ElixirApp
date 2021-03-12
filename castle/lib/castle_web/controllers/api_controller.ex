defmodule CastleWeb.APIController do
  use CastleWeb, :controller

  def login(conn, params) do
    {username, password} = {params["username"], params["password"]}
    f =
        conn
        |> send_resp(200, username)
  end

  def register(conn, _params) do
    f = 
        conn
        |> send_resp(200, "OK")
  end

end
