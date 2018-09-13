defmodule Bezexexchange.Repo.Migrations.CreateCurrency do
  @moduledoc """
  migration module for create currency
  Author: Sylvia Onwukwe
  """
  use Ecto.Migration

  def change do
    create table(:currency) do #creates currency table
      add :currency, :string #currency name in string type
      add :symbol, :string #currency symbol in string type example btc

      timestamps()
    end

  end
end
