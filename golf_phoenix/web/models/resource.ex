defmodule GolfPhoenix.Resource do
  use GolfPhoenix.Web, :model

  schema "resources" do
    field :name, :string
    field :url, :string
    field :tags, {:array, :string}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :url, :tags])
    |> validate_required([:name, :url, :tags])
    |> unique_constraint(:url)
  end
end
