defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:description, :date, :calories]
  @required_update_params @required_params
  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema "meals" do
    field :description, :string
    field :date, :date
    field :calories, :integer

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    changeset(struct, @required_params, params)
  end

  def update_changeset(struct, params) do
    changeset(struct, @required_update_params, params)
  end

  defp changeset(struct, required_fields, params) do
    struct
    |> cast(params, required_fields)
    |> validate_required(required_fields)
  end
end
