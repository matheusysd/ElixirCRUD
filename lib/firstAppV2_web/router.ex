defmodule FirstAppV2Web.Router do
  use FirstAppV2Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FirstAppV2Web do
    pipe_through :api
  end

  scope "/", FirstAppV2Web do #criação de rotas a partir de '/'
    get "/list", UserController, :get_users #metodo http, arquivo do controller, nome da função
    post "/create", UserController, :create_user
    get "/user/:id", UserController, :get_user
    delete "/delete", UserController, :delete_user
    put "/user", UserController, :update_user
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
