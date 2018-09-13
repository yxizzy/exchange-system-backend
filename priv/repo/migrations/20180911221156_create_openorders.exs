defmodule Bezexexchange.Repo.Migrations.CreateOpenorders do
  use Ecto.Migration

  def change do
    create table(:open_orders) do
      add :uuid, :uuid
      add :date, :utc_datetime
      add :amount, :float
      add :price, :float
      add :type, :string
      add :total, :float

      timestamps()
    end

  end
end
