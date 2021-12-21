defmodule LiveviewTailwindDemo.Accounts.Subscription do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscriptions" do
    field :end, :time
    field :limit, :integer
    field :start, :date
    field :tags, {:array, :string}
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(subscription, attrs) do
    subscription
    |> cast(attrs, [:title, :limit, :tags, :start, :end])
    |> validate_required([:title, :limit, :tags, :start, :end])
    |> unique_constraint(:title)
  end
end
