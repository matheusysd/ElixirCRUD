defmodule FirstAppV2Web.Router do
  use FirstAppV2Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FirstAppV2Web do
    pipe_through :api
  end

  scope "/", FirstAppV2Web do
    get "/list", UserController, :getUsers
    post "/create", UserController, :createUser
    get "/user/:id", UserController, :getUser
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: FirstAppV2Web.Telemetry
    end
  end
end
