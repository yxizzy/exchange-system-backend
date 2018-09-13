defmodule Bezexexchange.Repo.Migrations.CreateOrder do
  @moduledoc """
  migration module for orders
  Author: Sylvia Onwukwe
  """
  use Ecto.Migration

  def change do
    create table(:order) do #create order table
      add :date, :string #date order was made in string format
      add :pair, :string #string representing ordered pair
      add :type, :string #string representing type of order
      add :total, :string #total of order made in string format
      add :status, :string #order status in string format

      timestamps()
    end

  end
end
