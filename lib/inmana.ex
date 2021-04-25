defmodule Inmana do
  alias Inmana.Restaurants.Create, as: RestaurantCreate
  alias Inmana.Suplies.Create, as: SuplyCreate
  alias Inmana.Suplies.Get, as: SuplyGet

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate create_suply(params), to: SuplyCreate, as: :call
  defdelegate get_suply(uuid), to: SuplyGet, as: :call
end
