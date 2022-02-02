defmodule Calc.Repo.Migrations.CalculationsAddUserIdColumn do
  use Ecto.Migration

  def change do
    alter table(:calculations) do
      add :user_id, :integer
    end
  end
end
