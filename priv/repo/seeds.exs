defmodule Bezexexchange.DatabaseSeeder do
    @moduledoc """
    module for database population
    Example: this seeder populates the language repository with 100 languages
    Author: Sylvia Onwukwe
    """
    alias Bezexexchange.Repo
    alias Bezexexchange.Language

    @symbol_list ["Eng", "Arb", "Chi", "Fre"] #list of symbols
    @language_list ["English", "Arabic", "China", "French"] #list of languages
    @country_list ["English", "Arabic", "China", "French"] #list of countries associated with languages

    @doc """
    The function inserts symbol_list, language_list and country_list to the language repository
    """
    def insert_link do
        Repo.insert! %Language{
            symbol: (@symbol_list |> Enum.random()),
            language: (@language_list |> Enum.random()),
            country: (@country_list |> Enum.random())
        }
    end

    @doc """
    This function deletes all seeds from the repository
    """
    def clear do
        Repo.delete_all()
    end
end

(1..100) |> Enum.each(fn _ -> Bezexexchange.DatabaseSeeder.insert_link() end)