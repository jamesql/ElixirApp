defmodule CastleWeb.APIController do
  use CastleWeb, :controller

  alias Castle.Accounts

  def login(conn, params) do
    case params do
        %{"_csrf_token"=> _, "body"=> %{"email"=> email, "password"=> password}} -> # Browser Request
            case %{"email"=> email, "pass"=> password} |> Accounts.auth_with_email_and_password do
              {:ok, _, a} -> # Successful Login
                conn
                |> fetch_session
                |> put_session(:c_user, a)
                |> Phoenix.Controller.redirect(to: "/")
              {:error, r} -> # Error
                conn
                |> json(%{reason: r})
            end
        _ -> # Invalid Payload
            conn 
            |> send_resp(400, "Invalid Payload.")
    end
  end

  def register(conn, _params) do
      conn
      |> send_resp(200, "OK")
  end

  def logout(conn, _params) do
    conn 
    |> fetch_session
    |> clear_session
    |> Phoenix.Controller.redirect(to: "/")
  end

end
