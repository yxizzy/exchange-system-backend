defmodule BezexexchangeWeb.FeeView do
    use BezexexchangeWeb, :view
  
    def render("index.json", %{fee: fee}) do
      %{data: render_many(fee, BezexexchangeWeb.FeeView, "fee.json")}
    end
  
    def render("show.json", %{fee: fee}) do
      %{data: render_one(fee, BezexexchangeWeb.FeeView, "fee.json")}
    end
  
    def render("fee.json", %{fee: fee}) do
      %{fee: fee.fee}
    end
  end