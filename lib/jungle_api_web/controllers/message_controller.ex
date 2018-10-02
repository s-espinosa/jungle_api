alias JungleApi.Repo
alias JungleApi.Message
alias Ecto.Query

defmodule JungleApiWeb.MessageController do
  use JungleApiWeb, :controller

  def index(conn, _params) do
    messages = Repo.all(Message)
    render conn, "index.json", messages: messages
  end

  def show(conn, _params) do
    message = Message
      |> Query.last
      |> Repo.one
    render conn, "show.json", message: message
  end

  def create(conn, %{"message" => message_params}) do
    {_, message} = %Message{}
    |> Message.changeset(message_params)
    |> Repo.insert()
    render conn, "show.json", message: message
  end
end
