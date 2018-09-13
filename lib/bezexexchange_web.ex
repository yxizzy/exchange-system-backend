defmodule BezexexchangeWeb do
  @moduledoc """
  The entrypoint for defining web interface, such
  as controllers, views, channels and so on.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: BezexexchangeWeb
      import Plug.Conn
      import BezexexchangeWeb.Router.Helpers
      import BezexexchangeWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/bezexexchange_web/templates",
                        namespace: BezexexchangeWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      import BezexexchangeWeb.Router.Helpers
      import BezexexchangeWeb.ErrorHelpers
      import BezexexchangeWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import BezexexchangeWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
