defmodule BezexexchangeWeb.CurrencyController do
    use BezexexchangeWeb, :controller
  
    alias Bezexexchange.{Repo,Currency}

    def index(conn, _params) do
      currency = Repo.all(Currency)
      render(conn, "index.json", currency: currency)
    end

    def create(conn, currency_params) do
      changeset = Currency.changeset(%Currency{}, currency_params)

    case Repo.insert(changeset) do
        {:ok, currency} ->
          conn
          |> put_status(:created)
          |> render("show.json", currency: currency)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error creating currency"})
      end
    end

    def show(conn, %{"id" => id}) do
      currency = Repo.get!(Currency, id)
      render(conn, "show.json", currency: currency)
    end

    def update(conn, %{"id" => id, "currency" => currency_params}) do
      currency = Repo.get!(Currency, id)
      changeset = Currency.changeset(currency, currency_params)
  
      case Repo.update(changeset) do
        {:ok, currency} ->
          render(conn, "show.json", currency: currency)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error updating currency"})
      end
    end
  
    def delete(conn, %{"id" => id}) do
      currency = Repo.get!(Currency, id)
      Repo.delete!(currency)
  
      send_resp(conn, :no_content, "")
    end
  
    
  end