defmodule Bezexexchange.Repo.Migrations.CreatePair do
  @moduledoc """
  migration module for pair creation
  author: Sylvia Onwukwe
  """
  use Ecto.Migration

  def change do
    create table(:pair) do 
      add :pair, :string
      add :name, :string
      add :currency, :string

      timestamps()
    end

  end
end
