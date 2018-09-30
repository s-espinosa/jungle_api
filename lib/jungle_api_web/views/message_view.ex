defmodule JungleApiWeb.MessageView do
  use JungleApiWeb, :view

  def render("index.json", %{messages: messages}) do
    render_many(messages, JungleApiWeb.MessageView, "page.json")
  end

  def render("show.json", %{message: message}) do
    render_one(message, JungleApiWeb.MessageView, "page.json")
  end

  def render("page.json", %{message: message}) do
    %{text: message.text}
  end
end
