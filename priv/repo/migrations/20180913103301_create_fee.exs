defmodule Bezexexchange.Repo.Migrations.CreateFee do
  use Ecto.Migration

  def change do
    create table(:fee) do
      add :fee, :float

      timestamps()
    end

  end
end
