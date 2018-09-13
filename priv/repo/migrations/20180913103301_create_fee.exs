defmodule Bezexexchange.Repo.Migrations.CreateFee do
  @moduledoc """
  migration file for creating transaction fee
  author: Sylvia Onwukwe
  """
  use Ecto.Migration

  def change do
    create table(:fee) do #create table fee
      add :fee, :float #float representing transaction fee

      timestamps() #timestamps
    end

  end
end
