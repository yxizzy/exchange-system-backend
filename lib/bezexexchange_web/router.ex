defmodule BezexexchangeWeb.Router do
  use BezexexchangeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", BezexexchangeWeb do
    pipe_through :api

    resources "/openorders", OpenOrdersController
    resources "/currency", CurrencyController 
    resources "/language", LanguageController, except: [:new, :edit]
    resources "/orders", OrderController
    resources "/fees", FeeController, except: [:new, :edit, :delete]
  end
end
