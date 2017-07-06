defmodule GolfPhoenix.Tag do
  use GolfPhoenix.Web, :model

  schema "tags" do
    field :tag_name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:tag_name])
    |> validate_required([:tag_name])
    |> unique_constraint(:tag_name)
  end
end
