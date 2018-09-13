defmodule BezexexchangeWeb.FeeController do
    use BezexexchangeWeb, :controller
  
    alias Bezexexchange.{Repo,Fee}

    def index(conn, _params) do
      fee = Repo.all(Fee)
      render(conn, "index.json", fee: fee)
    end

    def create(conn, fee_params) do
      changeset = Fee.changeset(%Fee{}, fee_params)

    case Repo.insert(changeset) do
        {:ok, fee} ->
          conn
          |> put_status(:created)
          |> render("show.json", fee: fee)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error creating transaction fee"})
      end
    end

    def show(conn, %{"id" => id}) do
      fee = Repo.get!(Fee, id)
      render(conn, "show.json", fee: fee)
    end

    def update(conn, %{"id" => id, "fee" => fee_params}) do
      fee = Repo.get!(Fee, id)
      changeset = Fee.changeset(fee, fee_params)
  
      case Repo.update(changeset) do
        {:ok, fee} ->
          render(conn, "show.json", fee: fee)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error updating transaction fee"})
      end
    end
  
    
  end