alias JungleApi.Repo
alias JungleApi.Message
alias Ecto.Query

defmodule JungleApiWeb.MessageController do
  use JungleApiWeb, :controller

  def index(conn, _params) do
    Message
      |> Repo.all
      |> render_index(conn)
  end

  def show(conn, _params) do
    Message
      |> Query.last
      |> Repo.one
      |> render_show(conn)
  end

  def create(conn, %{"message" => message_params}) do
    %Message{}
      |> Message.changeset(message_params)
      |> Repo.insert()
      |> render_created(conn)
  end

  defp render_created({:ok, message}, conn) do
    render conn, "show.json", message: message
  end

  defp render_show(message, conn) do
    render conn, "show.json", message: message
  end

  defp render_index(messages, conn) do
    render conn, "index.json", messages: messages
  end
end
