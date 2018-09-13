defmodule Bezexexchange.Repo.Migrations.CreateCurrency do
  use Ecto.Migration

  def change do
    create table(:currency) do
      add :currency, :string
      add :symbol, :string

      timestamps()
    end

  end
end
