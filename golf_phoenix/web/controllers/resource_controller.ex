defmodule GolfPhoenix.ResourceController do
  use GolfPhoenix.Web, :controller
  import Ecto.Query, only: [where: 3]

  alias GolfPhoenix.Resource

  def find_resources(params) do 
    query = 
    case params["resource"] do 
      %{"tags" => tags } -> find_query(tags)
      _                  -> Resource
    end
    Repo.all(query)
  end

  def find_query(tags) do 
    tags
      |> String.downcase()
      |> String.split()
      |> Enum.reduce( GolfPhoenix.Resource, fn val, q1 -> where(q1, [r], ^val in r.tags) end)
  end
  

  def index(conn, params) do
    resources = find_resources(params)
    changeset = Resource.changeset(%Resource{})
    render(conn, "index.html", resources: resources, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Resource.changeset(%Resource{})
    render(conn, "new.html", changeset: changeset)
  end


  defp normalize_tags(tags) do
    tags
    |> Enum.flat_map( &normalize_tag/1 )
    |> Enum.sort()
  end
  defp normalize_tag(tag) do 
    tag 
    |> String.downcase()
    |> String.split(" ")
  end

  def create(conn, %{"resource" => resource_params}) do
    resource_params1 = 
      resource_params
      |> Map.put("tags", normalize_tags(resource_params["tags"]))

    changeset = Resource.changeset(%Resource{}, resource_params1)

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
    resource_params1 = resource_params
                        |> Map.put("tags", normalize_tags(resource_params["tags"]))
    changeset = Resource.changeset(resource, resource_params1)

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
