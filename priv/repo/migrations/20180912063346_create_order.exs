defmodule Bezexexchange.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:order) do
      add :date, :string
      add :pair, :string
      add :type, :string
      add :total, :string
      add :status, :string

      timestamps()
    end

  end
end
