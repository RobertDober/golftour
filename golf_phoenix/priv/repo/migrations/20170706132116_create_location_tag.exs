defmodule GolfPhoenix.Repo.Migrations.CreateLocationTag do
  use Ecto.Migration

  def change do
    create table(:location_tags) do
      add :desc, :string
      add :tag_id, references(:tags, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end
    create index(:location_tags, [:tag_id])
    create index(:location_tags, [:location_id])

  end
end
