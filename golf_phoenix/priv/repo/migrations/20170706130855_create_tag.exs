defmodule GolfPhoenix.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :tag_name, :string

      timestamps()
    end
    create unique_index(:tags, [:tag_name])

  end
end
