defmodule Bezexexchange.Orders do
  @moduledoc """
  Module for Orders
  ...
  This module also has a changeset/2 function
  Author: Sylvia Onwukwe
  """
  #use ecto.schema
  use Ecto.Schema
  #use ecto.changeset
  import Ecto.Changeset

  @doc """
  schema for order
  ## Parameters
  -date: string representing the date order was made
  -pair: string that represents the pair ordered e.g BTC/BEZ
  -status: string that represents the status of the order
  """
  schema "order" do
    field :date, :string
    field :pair, :string
    field :status, :string
    field :total, :string
    field :type, :string

    timestamps()
  end

  @doc """
  Creates a changeset based on the `orders` and `attrs`.
  ## Parameters
  -orders: the orders model
  -attrs: entered parameters
  """
  def changeset(orders, attrs) do
    orders
    #convert map to changeset and limit the inbound parameters to specified types
    |> cast(attrs, [:date, :pair, :type, :total, :status])
    |> validate_required([:date, :pair, :type, :total, :status])
  end
end
