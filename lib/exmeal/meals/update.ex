defmodule Exmeal.Meals.Update do
  alias Exmeal.{Error, Meal, Repo }

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.meal_not_found()}
      meal -> validate_and_update(meal, params)
    end
  end

  defp validate_and_update(meal, params) do
    meal
    |> Meal.update_changeset(params)
    |> Repo.update()
  end
end
