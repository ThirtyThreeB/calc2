defmodule Calc.Repo.Migrations.CreateCalculations do
  use Ecto.Migration

  def change do
    create table(:calculations) do
      add :equation, :string

      timestamps()
    end
  end
end
