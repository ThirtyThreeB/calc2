defmodule Calc.Calculation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calculations" do
    field :equation, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(calculation, attrs) do
    calculation
    |> cast(attrs, [:equation, :user_id])
    |> validate_required([:equation, :user_id])
  end
end
