defmodule GolfPhoenix.LocationTag do
  use GolfPhoenix.Web, :model

  schema "location_tags" do
    field :desc, :string
    belongs_to :tag, GolfPhoenix.Tag
    belongs_to :location, GolfPhoenix.Location

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:desc])
    |> validate_required([:desc])
  end
end
