defmodule GolfPhoenix.ResourceControllerTest do
  use GolfPhoenix.ConnCase

  alias GolfPhoenix.Resource
  @valid_attrs %{name: "some content", tags: [], url: "some content"}
  @invalid_attrs %{}

  describe "index" do
    test "lists all entries by default", %{conn: conn} do
      [
        Resource.changeset(%Resource{}, %{name: "Res One", tags: ~w(one res), url: "url1"}),
        Resource.changeset(%Resource{}, %{name: "Res Two", tags: ~w(two res), url: "url2"})
      ] |> Enum.each( &Repo.insert!(&1) )
      conn = get conn, resource_path(conn, :index)
      assert html_response(conn, 200) =~ "Liste des Ressources"
      assert html_response(conn, 200) =~ "Res One"
      refute html_response(conn, 200) =~ "Res Three"
    end

    test "lists some entries on index with search", %{conn: conn} do 
      [
        Resource.changeset(%Resource{}, %{name: "Res One", tags: ~w(one res), url: "url1"}),
        Resource.changeset(%Resource{}, %{name: "Res Two", tags: ~w(two res), url: "url2"})
      ] |> Enum.each( &Repo.insert!(&1) )
      conn = get conn, resource_path(conn, :index, %{resource: %{tags: ~s(ONE reS)}})
      assert html_response(conn, 200) =~ "Liste des Ressources"
      assert html_response(conn, 200) =~ "Res One"
      refute html_response(conn, 200) =~ "Res Two"
    end
  end

  # test "renders form for new resources", %{conn: conn} do
  #   conn = get conn, resource_path(conn, :new)
  #   assert html_response(conn, 200) =~ "New resource"
  # end

  # test "creates resource and redirects when data is valid", %{conn: conn} do
  #   conn = post conn, resource_path(conn, :create), resource: @valid_attrs
  #   assert redirected_to(conn) == resource_path(conn, :index)
  #   assert Repo.get_by(Resource, @valid_attrs)
  # end

  # test "does not create resource and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, resource_path(conn, :create), resource: @invalid_attrs
  #   assert html_response(conn, 200) =~ "New resource"
  # end

  # test "shows chosen resource", %{conn: conn} do
  #   resource = Repo.insert! %Resource{}
  #   conn = get conn, resource_path(conn, :show, resource)
  #   assert html_response(conn, 200) =~ "Show resource"
  # end

  # test "renders page not found when id is nonexistent", %{conn: conn} do
  #   assert_error_sent 404, fn ->
  #     get conn, resource_path(conn, :show, -1)
  #   end
  # end

  # test "renders form for editing chosen resource", %{conn: conn} do
  #   resource = Repo.insert! %Resource{}
  #   conn = get conn, resource_path(conn, :edit, resource)
  #   assert html_response(conn, 200) =~ "Edit resource"
  # end

  # test "updates chosen resource and redirects when data is valid", %{conn: conn} do
  #   resource = Repo.insert! %Resource{}
  #   conn = put conn, resource_path(conn, :update, resource), resource: @valid_attrs
  #   assert redirected_to(conn) == resource_path(conn, :show, resource)
  #   assert Repo.get_by(Resource, @valid_attrs)
  # end

  # test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #   resource = Repo.insert! %Resource{}
  #   conn = put conn, resource_path(conn, :update, resource), resource: @invalid_attrs
  #   assert html_response(conn, 200) =~ "Edit resource"
  # end

  # test "deletes chosen resource", %{conn: conn} do
  #   resource = Repo.insert! %Resource{}
  #   conn = delete conn, resource_path(conn, :delete, resource)
  #   assert redirected_to(conn) == resource_path(conn, :index)
  #   refute Repo.get(Resource, resource.id)
  # end
end
