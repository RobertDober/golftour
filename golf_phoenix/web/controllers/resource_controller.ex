defmodule GolfPhoenix.ResourceController do
  use GolfPhoenix.Web, :controller

  alias GolfPhoenix.Resource

  def index(conn, _params) do
    resources = Repo.all(Resource)
    render(conn, "index.html", resources: resources)
  end

  def new(conn, _params) do
    changeset = Resource.changeset(%Resource{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resource" => resource_params}) do
    changeset = Resource.changeset(%Resource{}, resource_params)

    case Repo.insert(changeset) do
      {:ok, _resource} ->
        conn
        |> put_flash(:info, "Resource created successfully.")
        |> redirect(to: resource_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resource = Repo.get!(Resource, id)
    render(conn, "show.html", resource: resource)
  end

  def edit(conn, %{"id" => id}) do
    resource = Repo.get!(Resource, id)
    changeset = Resource.changeset(resource)
    render(conn, "edit.html", resource: resource, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resource" => resource_params}) do
    resource_params = Map.put_new(resource_params, "tags", nil)
    resource = Repo.get!(Resource, id)
    changeset = Resource.changeset(resource, resource_params)

    case Repo.update(changeset) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource updated successfully.")
        |> redirect(to: resource_path(conn, :show, resource))
      {:error, changeset} ->
        render(conn, "edit.html", resource: resource, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource = Repo.get!(Resource, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(resource)

    conn
    |> put_flash(:info, "Resource deleted successfully.")
    |> redirect(to: resource_path(conn, :index))
  end
end
