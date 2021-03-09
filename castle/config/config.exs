# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :castle,
  ecto_repos: [Castle.Repo]

# Configures the endpoint
config :castle, CastleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2Q0sTjPGiLAK7LBNywoGlNLPDiKVEhQda1LB1y4wMfOaZK51x4h0IxrrUXv9BOKD",
  render_errors: [view: CastleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Castle.PubSub,
  live_view: [signing_salt: "v8krose4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
