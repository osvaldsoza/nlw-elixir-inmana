defmodule InmanaWeb.SupliesView do
  use InmanaWeb, :view

  def render("create.json", %{suply: suply}) do
    %{
      message: "Suply created",
      suply: suply
    }
  end

  def render("show.json", %{suply: suply}), do: %{suply: suply}
end
