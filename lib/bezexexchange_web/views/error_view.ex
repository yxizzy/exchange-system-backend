defmodule BezexexchangeWeb.ErrorView do
  @moduledoc """
  Module for all Error view
  ...
  This module also has render/2 functions and template_not_found/2 function
  Author: Sylvia Onwukwe
  """
  use BezexexchangeWeb, :view

  #render clause matches 404.json
  def render("404.json", _assigns) do
    %{errors: %{detail: "Page not found"}}
  end

  #render clause matches 422.json
  def render("422.json", _assigns) do
    %{errors: %{detail: "Bad request"}}
  end 

  #render clause matches 500.json
  def render("500.json", _assigns) do
    %{errors: %{detail: "Internal server error"}}
  end

  #In case no render clause matches or no template is found, renders 500.json
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
