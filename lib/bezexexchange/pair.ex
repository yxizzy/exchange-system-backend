defmodule Bezexexchange.Pair do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pair" do
    field :currency, :string
    field :name, :string
    field :pair, :string

    timestamps()
  end

  @doc false
  def changeset(pair, attrs) do
    pair
    |> cast(attrs, [:pair, :name, :currency])
    |> validate_required([:pair, :name, :currency])
  end
end
