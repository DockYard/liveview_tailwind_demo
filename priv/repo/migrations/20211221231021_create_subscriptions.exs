defmodule LiveviewTailwindDemo.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add :title, :string
      add :limit, :integer
      add :tags, {:array, :string}
      add :start, :date
      add :end, :time
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:subscriptions, [:title])
    create index(:subscriptions, [:user_id])
  end
end
