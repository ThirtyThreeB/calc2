defmodule Calc.Calculation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calculations" do
    field :equation, :string

    timestamps()
  end

  @doc false
  def changeset(calculation, attrs) do
    calculation
    |> cast(attrs, [:equation])
    |> validate_required([:equation])
  end
end
