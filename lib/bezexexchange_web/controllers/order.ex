defmodule BezexexchangeWeb.OrderController do
    use BezexexchangeWeb, :controller
  
    alias Bezexexchange.{Repo,Orders}

    def index(conn, _params) do
      orders = Repo.all(Orders)
      render(conn, "index.json", orders: orders)
    end

    def create(conn,order) do
      changeset = Orders.changeset(%Orders{}, order)
  
      case Repo.insert(changeset) do
        {:ok, order} ->
          conn
          |> put_status(:created)
          |> render("show.json", order: order)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error creating data"})
      end
    end

    def show(conn, %{"id" => id}) do
      order = Repo.get!(Orders, id)
      render(conn, "show.json", order: order)
    end

    def update(conn, %{"id" => id, "order" => order_params}) do
      order = Repo.get!(Orders, id)
      changeset = Orders.changeset(order, order_params)
  
      case Repo.update(changeset) do
        {:ok, order} ->
          render(conn, "show.json", order: order)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error updating data"})
      end
    end
  
    def delete(conn, %{"id" => id}) do
      order = Repo.get!(Orders, id)
      Repo.delete!(order)
  
      send_resp(conn, :no_content, "")
    end
  
    
  end