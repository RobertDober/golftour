# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :golf_phoenix,
  ecto_repos: [GolfPhoenix.Repo]

# Configures the endpoint
config :golf_phoenix, GolfPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "j5qz+pmI8cdSHgq5li89u5q2npcE7Kxo+i+u7j0Jm/EENZi/N6AZ3Ld/7fRhI/5n",
  render_errors: [view: GolfPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GolfPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
