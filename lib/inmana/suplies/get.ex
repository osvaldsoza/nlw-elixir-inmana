defmodule Inmana.Suplies.Get do
  alias Inmana.{Repo, Suply}

  def call(uuid) do
    case Repo.get(Suply, uuid) do
      nil -> {:error, %{result: "Suply not found", status: :not_found}}
      suply -> {:ok, suply}
    end
  end

  # def call(uuid) do
  #   Suply
  #   |> Repo.get(uuid)
  #   |> handle_get()
  # end

  # defp handle_get(%Suply{} = result), do: {:ok, result}
  # defp handle_get(nil), do: {:error, %{result: "Suply not found", status: :not_found}}
end
