# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :firstAppV2,
  ecto_repos: [FirstAppV2.Repo]

# Configures the endpoint
config :firstAppV2, FirstAppV2Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "P7/SktisxsrDaKhJwrSdy86BTTJSDpD5ayqkYbCZ6l2VUIm9+N6He8/+bN+zX3Wl",
  render_errors: [view: FirstAppV2Web.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: FirstAppV2.PubSub,
  live_view: [signing_salt: "yP0lasaE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
