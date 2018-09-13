defmodule BezexexchangeWeb.PairView do
    use BezexexchangeWeb, :view
  
    def render("index.json", %{pair: pair}) do
      %{data: render_many(pair, BezexexchangeWeb.PairView, "pair.json")}
    end
  
    def render("show.json", %{pair: pair}) do
      %{data: render_one(pair, BezexexchangeWeb.PairView, "pair.json")}
    end
  
    def render("pair.json", %{pair: pair}) do
      %{pair: pair.pair,
        name: pair.name,
        currency: pair.currency}
    end
  end