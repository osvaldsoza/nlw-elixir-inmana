defmodule Inmana.Suplies.Create do
  alias Inmana.{Repo, Suply}

  def call(params) do
    params
    |> Suply.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Suply{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
