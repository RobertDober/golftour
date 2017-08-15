defmodule GolfPhoenix.ResourceTest do
  use GolfPhoenix.ModelCase

  alias GolfPhoenix.Resource

  @valid_attrs %{name: "some content", tags: [], url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Resource.changeset(%Resource{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Resource.changeset(%Resource{}, @invalid_attrs)
    refute changeset.valid?
  end
end
