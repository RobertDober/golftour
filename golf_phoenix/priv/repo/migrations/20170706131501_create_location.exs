defmodule GolfPhoenix.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :url, :text

      timestamps()
    end

  end
end
