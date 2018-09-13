defmodule Bezexexchange.Currency do
  @moduledoc """
  Module for Currency
  ...
  This module also has a changeset/2 function
  Author: Sylvia Onwukwe
  """
  #use ecto.schema
  use Ecto.Schema
  #use ecto.changeset
  import Ecto.Changeset

  @doc """
  schema for currency
  ## Parameters
  -currency: string representing the title/name of currency
  -symbol: string that represents the symbol/abbreviation of the currency
  """
  schema "currency" do
    field :currency, :string
    field :symbol, :string

    timestamps()
  end

  @doc """
  Creates a changeset based on the `currency` and `attrs`.
  ## Parameters
  -currency: the currency model
  -attrs: entered parameters
  """
  def changeset(currency, attrs) do
    currency
    |> cast(attrs, [:currency, :symbol])
    |> validate_required([:currency, :symbol])
  end
end
