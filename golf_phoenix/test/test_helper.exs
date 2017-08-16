ExUnit.configure(timeout: :infinity) 
ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(GolfPhoenix.Repo, :manual)

