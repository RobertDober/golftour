# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :golf13,
  ecto_repos: [Golf13.Repo]

# Configures the endpoint
config :golf13, Golf13Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IepWQFvvY63iFr7GPQdIoANEKaRtZe1rpb1ePOzzl5idyr2BRoZtM6UQKJWdP3zZ",
  render_errors: [view: Golf13Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Golf13.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
