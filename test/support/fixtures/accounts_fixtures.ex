defmodule LiveviewTailwindDemo.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveviewTailwindDemo.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name"
      })
      |> LiveviewTailwindDemo.Accounts.create_user()

    user
  end

  @doc """
  Generate a unique subscription title.
  """
  def unique_subscription_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a subscription.
  """
  def subscription_fixture(attrs \\ %{}) do
    {:ok, subscription} =
      attrs
      |> Enum.into(%{
        end: ~T[14:00:00],
        limit: 42,
        start: ~D[2021-12-20],
        tags: [],
        title: unique_subscription_title()
      })
      |> LiveviewTailwindDemo.Accounts.create_subscription()

    subscription
  end
end
