use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :golf_phoenix, GolfPhoenix.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :golf_phoenix, GolfPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "golf_phoenix_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  ownership_timeout: 10 * 60 * 1000 # long timeout so pry sessions don't break

