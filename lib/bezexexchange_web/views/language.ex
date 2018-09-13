defmodule BezexexchangeWeb.LanguageView do
    use BezexexchangeWeb, :view
  
    def render("index.json", %{language: language}) do
      %{data: render_many(language, BezexexchangeWeb.LanguageView, "language.json")}
    end
  
    def render("show.json", %{language: language}) do
      %{data: render_one(language, BezexexchangeWeb.LanguageView, "language.json")}
    end
  
    def render("language.json", %{language: language}) do
      %{language: language.language,
        country: language.country,
        symbol: language.symbol}
    end
  end