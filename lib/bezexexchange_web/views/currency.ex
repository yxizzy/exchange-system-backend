defmodule BezexexchangeWeb.CurrencyView do
    use BezexexchangeWeb, :view
  
    def render("index.json", %{currency: currency}) do
      %{data: render_many(currency, BezexexchangeWeb.CurrencyView, "currency.json")}
    end
  
    def render("show.json", %{currency: currency}) do
      %{data: render_one(currency, BezexexchangeWeb.CurrencyView, "currency.json")}
    end
  
    def render("currency.json", %{currency: currency}) do
      %{currency: currency.currency,
        symbol: currency.symbol}
    end
  end