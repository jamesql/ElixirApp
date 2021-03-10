defmodule CastleWeb.Router do
  use CastleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CastleWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", CastleWeb do
    pipe_through :api

    post "/login", APIController, :login
    post "/register", APIController, :register

  end
  
end
