defmodule GolfPhoenix.Location do
  use GolfPhoenix.Web, :model

  schema "locations" do
    field :name, :string
    field :url, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :url])
    |> validate_required([:name, :url])
  end
  @doc """
  Convenience changeset method
  """
  def changeset!(params \\ %{}) do
    changeset(%__MODULE__{}, params)
  end
end
