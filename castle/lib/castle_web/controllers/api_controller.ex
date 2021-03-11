defmodule CastleWeb.APIController do
  use CastleWeb, :controller

  def login(conn, _params) do
    f =
        conn
        |> send_resp(200, "OK")
  end

  def register(conn, _params) do
    f = 
        conn
        |> send_resp(200, "OK")
  end

end
