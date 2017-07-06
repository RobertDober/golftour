defmodule GolfPhoenix.LocationTagTest do
  use GolfPhoenix.ModelCase

  alias GolfPhoenix.LocationTag

  @valid_attrs %{desc: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LocationTag.changeset(%LocationTag{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LocationTag.changeset(%LocationTag{}, @invalid_attrs)
    refute changeset.valid?
  end
end
