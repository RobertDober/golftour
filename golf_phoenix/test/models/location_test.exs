defmodule GolfPhoenix.LocationTest do
  use GolfPhoenix.ModelCase

  alias GolfPhoenix.Location

  @valid_attrs %{name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset!(@valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset!(@invalid_attrs)
    refute changeset.valid?
  end
end
