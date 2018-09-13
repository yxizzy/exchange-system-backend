defmodule BezexexchangeWeb.PairController do
    use BezexexchangeWeb, :controller
  
    alias Bezexexchange.{Repo,Pair}

    def index(conn, _params) do
      pair = Repo.all(Pair)
      render(conn, "index.json", pair: pair)
    end

    def create(conn, pair_params) do
      changeset = Pair.changeset(%Pair{}, pair_params)

    case Repo.insert(changeset) do
        {:ok, pair} ->
          conn
          |> put_status(:created)
          |> render("show.json", pair: pair)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error creating pair"})
      end
    end

    def show(conn, %{"id" => id}) do
      pair = Repo.get!(Pair, id)
      render(conn, "show.json", pair: pair)
    end

    def update(conn, id, pair_params) do
      pair = Repo.get!(Pair, id)
      changeset = Pair.changeset(pair, pair_params)
  
      case Repo.update(changeset) do
        {:ok, pair} ->
          render(conn, "show.json", pair: pair)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error updating pair"})
      end
    end
  
    def delete(conn,id) do
        pair = Repo.get!(Pair, id)
      Repo.delete!(pair)
  
      send_resp(conn, :no_content, "")
    end
  
    
  end