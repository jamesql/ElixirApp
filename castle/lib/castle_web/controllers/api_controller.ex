defmodule CastleWeb.APIController do
  use CastleWeb, :controller

  def login(conn, _params) do
    text conn, "Test"
  end

  def register(conn, _params) do
    text conn, "Test"
  end

  def rd_body() do
  end

end
