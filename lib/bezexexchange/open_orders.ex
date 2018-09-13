defmodule Bezexexchange.OpenOrders do
  @moduledoc """
  Module for Open Orders
  ...
  This module also has a changeset/2 function
  Author: Sylvia Onwukwe
  """
  #use ecto.schema
  use Ecto.Schema
  #import Ecto.changeset
  import Ecto.Changeset

  @doc """
  schema for openorders
  ## Parameters
  -amount: float representing the amount of order placed
  -date: utc_datetime that represents the date order was made
  -price: float that represents the price of the order placed
  -total: float that represents the amount*price
  -type: string that represents type of order placed(Buy/Sell)
  -timestamp: generates inserted_at and completed_at 
  """

  schema "openorders" do
    field :amount, :float
    field :date, :utc_datetime
    field :price, :float
    field :total, :float
    field :type, :string
    field :uuid, Ecto.UUID

    timestamps()
  end

   @doc """
  Creates a changeset based on the `open_orders` and `attrs`.
  ## Parameters
  -open_orders: the openorder model
  -attrs: entered parameters
  """
  def changeset(open_orders, attrs) do
    open_orders
    |> cast(attrs, [:date, :type, :price, :amount, :total, :uuid])
  end
end
