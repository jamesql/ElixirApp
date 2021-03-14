defmodule CastleWeb.APIController do
  use CastleWeb, :controller
  import Castle.Accounts

  alias Castle.Accounts

  def login(conn, params) do
    case params do
        %{"_csrf_token"=> t, "body"=> %{"email"=> email, "password"=> password}} -> # Browser Request
            case %{"email"=> email, "pass"=> password} |> Accounts.auth_with_email_and_password do
              {:ok, _, a} -> 
                conn
                |> Phoenix.Controller.redirect(to: "/")
              _ ->
                conn
                |> json(%{id: 404})
            end
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
