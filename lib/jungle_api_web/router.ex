defmodule JungleApiWeb.Router do
  use JungleApiWeb, :router

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

  scope "/", JungleApiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", JungleApiWeb do
    pipe_through :api

    get "/messages", MessageController, :index
    get "/messages/last", MessageController, :show
    post "/messages", MessageController, :create
  end
end
