defmodule JungleApi.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :text, :string

      timestamps()
    end

  end
end
