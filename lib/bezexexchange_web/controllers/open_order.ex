defmodule BezexexchangeWeb.OpenOrdersController do
    use BezexexchangeWeb, :controller
  
    alias Bezexexchange.{Repo,OpenOrders}

    def index(conn, _params) do
      open_orders = Repo.all(OpenOrders)
      render(conn, "index.json", open_orders: open_orders)
    end

    def create(conn, open_order) do
      changeset = OpenOrders.changeset(%OpenOrders{}, open_order)
  
      case Repo.insert(changeset) do
        {:ok, open_order} ->
          conn
          |> put_status(:created)
          |> render("show.json", open_order: open_order)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error creating data"})
      end
    end

    def show(conn, %{"id" => id}) do
      openorder = Repo.get!(OpenOrders, id)
      render(conn, "show.json", openorder: openorder)
    end

    def update(conn, %{"id" => id, "openorder" => openorder_params}) do
      openorder = Repo.get!(OpenOrders, id)
      changeset = OpenOrders.changeset(openorder, openorder_params)
  
      case Repo.update(changeset) do
        {:ok, openorder} ->
          render(conn, "show.json", openorder: openorder)
        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> json(%{error: "error updating data"})
      end
    end
  
    def delete(conn, %{"id" => id}) do
      openorder = Repo.get!(OpenOrders, id)
      Repo.delete!(openorder)
  
      send_resp(conn, :no_content, "")
    end
  
    
  end