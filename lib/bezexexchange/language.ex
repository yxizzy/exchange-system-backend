defmodule Bezexexchange.Language do
  @moduledoc """
  Module for Language
  ...
  This module also has a changeset/2 function
  Author: Sylvia Onwukwe
  """
  #use ecto.schema
  use Ecto.Schema
  #import Ecto.changeset
  import Ecto.Changeset

  @doc """
  schema for language
  ## Parameters
  -language: string representing the name of language
  -symbol: string that represents the symbol/abbreviation of the language
  -country: string that represents the language country
  -timestamp: generates inserted_at and completed_at 
  """
  schema "language" do
    field :country, :string
    field :language, :string
    field :symbol, :string

    timestamps()
  end

  @doc false
  def changeset(language, attrs) do
    language
    |> cast(attrs, [:language, :country, :symbol])
    |> validate_required([:language, :country, :symbol])
  end
end
