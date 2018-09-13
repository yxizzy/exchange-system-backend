defmodule BezexexchangeWeb.OpenOrdersView do
    use BezexexchangeWeb, :view
  
    def render("index.json", %{open_orders: open_orders}) do
      %{data: render_many(open_orders, BezexexchangeWeb.OpenOrdersView, "openorders.json")}
    end
  
    def render("show.json", %{open_order: open_order}) do
      %{data: render_one(open_order, BezexexchangeWeb.OpenOrdersView, "openorders.json")}
    end
  
    def render("openorders.json", %{open_orders: open_orders}) do
      %{uuid: open_orders.uuid,
        date: open_orders.date,
        amount: open_orders.amount,
        price: open_orders.price,
        total: open_orders.total,
        type: open_orders.type}
    end
  end