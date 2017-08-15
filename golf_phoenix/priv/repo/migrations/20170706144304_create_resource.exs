defmodule GolfPhoenix.Repo.Migrations.CreateResource do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :name, :string
      add :url, :text
      add :tags, {:array, :string}

      timestamps()
    end
    create unique_index(:resources, [:url])

  end
end
