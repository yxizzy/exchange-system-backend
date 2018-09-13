defmodule BezexexchangeWeb.OrderView do
    use BezexexchangeWeb, :view
  
    def render("index.json", %{orders: orders}) do
      %{data: render_many(orders, BezexexchangeWeb.OrderView, "orders.json")}
    end
  
    def render("show.json", %{order: order}) do
      %{data: render_one(order, BezexexchangeWeb.OrderView, "orders.json")}
    end
  
    def render("orders.json", %{order: order}) do
      %{
        date: order.date,
        amount: order.pair,
        price: order.status,
        total: order.total,
        type: order.type}
    end
  end