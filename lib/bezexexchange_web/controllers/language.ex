defmodule BezexexchangeWeb.LanguageController do
    use BezexexchangeWeb, :controller
  
    alias Bezexexchange.{Repo,Language}

    def index(conn, _params) do
      language = Repo.all(Language)
      render(conn, "index.json", language: language)
    end

    def create(conn, language_params) do
      changeset = Language.changeset(%Language{}, language_params)

    case Repo.insert(changeset) do
        {:ok, language} ->
          conn
          |> put_status(:created)
          |> render("show.json", language: language)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error creating language"})
      end
    end

    def show(conn, %{"id" => id}) do
      language = Repo.get!(Language, id)
      render(conn, "show.json", language: language)
    end

    def update(conn, id, language_params) do
      language = Repo.get!(Language, id)
      changeset = Language.changeset(language, language_params)
  
      case Repo.update(changeset) do
        {:ok, language} ->
          render(conn, "show.json", language: language)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error updating language"})
      end
    end
  
    def delete(conn,id) do
      language = Repo.get!(Language, id)
      Repo.delete!(language)
  
      send_resp(conn, :no_content, "")
    end
  
    
  end