defmodule GolfPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :golf_phoenix,
    adapter: Ecto.Adapters.Postgres
end
