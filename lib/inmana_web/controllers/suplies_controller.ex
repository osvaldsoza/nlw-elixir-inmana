defmodule InmanaWeb.SupliesController do
  use InmanaWeb, :controller

  alias Inmana.Suply

  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Suply{} = suply} <- Inmana.create_suply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", suply: suply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Suply{} = suply} <- Inmana.get_suply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", suply: suply)
    end
  end
end
