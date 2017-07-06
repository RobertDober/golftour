defmodule GolfPhoenix.Router do
  use GolfPhoenix.Web, :router

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

  scope "/", GolfPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/tags", TagController # Other scopes may use custom stacks.
    resources "/locations", LocationController
  end

  # scope "/api", GolfPhoenix do
  #   pipe_through :api
  # end
end
