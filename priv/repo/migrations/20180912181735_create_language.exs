defmodule Bezexexchange.Repo.Migrations.CreateLanguage do
  @moduledoc """
  migration module for create language
  author: Sylvia Onwukwe
  """
  use Ecto.Migration

  def change do
    create table(:language) do
      add :language, :string
      add :country, :string
      add :symbol, :string

      timestamps()
    end

  end
end
