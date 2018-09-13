defmodule Bezexexchange.Repo.Migrations.CreateOpenorders do
  @moduledoc """
  migration module for openorders
  Author: Sylvia Onwukwe
  """
  use Ecto.Migration

  def change do
    create table(:open_orders) do
      add :uuid, :uuid #open orders uuid
      add :date, :utc_datetime #date order was placed represented in utc_datetime format
      add :amount, :float #float representing amount of the opened order
      add :price, :float #Float showing the price of the opened order
      add :type, :string #string representing type of order
      add :total, :float #float representing the amount*price

      timestamps() #timestamps generating inserted_at and completed_at
    end

  end
end
