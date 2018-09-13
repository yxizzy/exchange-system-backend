defmodule BezexexchangeWeb.Router do
  @moduledoc """
  router module 
  author: Sylvia Onwukwe
  """
  use BezexexchangeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", BezexexchangeWeb do
    pipe_through :api

    resources "/openorders", OpenOrdersController #creates 8 routes for openorders
    resources "/currency", CurrencyController #creates 8 routes for currency
    resources "/language", LanguageController, except: [:new, :edit] #creates 6 routes for language
    resources "/orders", OrderController #creates 8 routes for orders
    resources "/pair", PairController #create 8 routes for pair
    resources "/fees", FeeController, except: [:new, :edit, :delete] #creates 5 routes for fees
  end
end
