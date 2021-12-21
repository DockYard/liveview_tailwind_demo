defmodule LiveviewTailwindDemo.AccountsTest do
  use LiveviewTailwindDemo.DataCase

  alias LiveviewTailwindDemo.Accounts

  describe "users" do
    alias LiveviewTailwindDemo.Accounts.User

    import LiveviewTailwindDemo.AccountsFixtures

    @invalid_attrs %{email: nil, name: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", name: "some name"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", name: "some updated name"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "subscriptions" do
    alias LiveviewTailwindDemo.Accounts.Subscription

    import LiveviewTailwindDemo.AccountsFixtures

    @invalid_attrs %{end: nil, limit: nil, start: nil, tags: nil, title: nil}

    test "list_subscriptions/0 returns all subscriptions" do
      subscription = subscription_fixture()
      assert Accounts.list_subscriptions() == [subscription]
    end

    test "get_subscription!/1 returns the subscription with given id" do
      subscription = subscription_fixture()
      assert Accounts.get_subscription!(subscription.id) == subscription
    end

    test "create_subscription/1 with valid data creates a subscription" do
      valid_attrs = %{end: ~T[14:00:00], limit: 42, start: ~D[2021-12-20], tags: [], title: "some title"}

      assert {:ok, %Subscription{} = subscription} = Accounts.create_subscription(valid_attrs)
      assert subscription.end == ~T[14:00:00]
      assert subscription.limit == 42
      assert subscription.start == ~D[2021-12-20]
      assert subscription.tags == []
      assert subscription.title == "some title"
    end

    test "create_subscription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_subscription(@invalid_attrs)
    end

    test "update_subscription/2 with valid data updates the subscription" do
      subscription = subscription_fixture()
      update_attrs = %{end: ~T[15:01:01], limit: 43, start: ~D[2021-12-21], tags: [], title: "some updated title"}

      assert {:ok, %Subscription{} = subscription} = Accounts.update_subscription(subscription, update_attrs)
      assert subscription.end == ~T[15:01:01]
      assert subscription.limit == 43
      assert subscription.start == ~D[2021-12-21]
      assert subscription.tags == []
      assert subscription.title == "some updated title"
    end

    test "update_subscription/2 with invalid data returns error changeset" do
      subscription = subscription_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_subscription(subscription, @invalid_attrs)
      assert subscription == Accounts.get_subscription!(subscription.id)
    end

    test "delete_subscription/1 deletes the subscription" do
      subscription = subscription_fixture()
      assert {:ok, %Subscription{}} = Accounts.delete_subscription(subscription)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_subscription!(subscription.id) end
    end

    test "change_subscription/1 returns a subscription changeset" do
      subscription = subscription_fixture()
      assert %Ecto.Changeset{} = Accounts.change_subscription(subscription)
    end
  end
end
