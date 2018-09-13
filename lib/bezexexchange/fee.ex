defmodule Bezexexchange.Fee do
  use Ecto.Schema
  import Ecto.Changeset


  schema "fee" do
    field :fee, :float

    timestamps()
  end

  @doc false
  def changeset(fee, attrs) do
    fee
    |> cast(attrs, [:fee])
    |> validate_required([:fee])
  end
end
