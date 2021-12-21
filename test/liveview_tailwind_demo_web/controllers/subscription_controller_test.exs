defmodule LiveviewTailwindDemoWeb.SubscriptionControllerTest do
  use LiveviewTailwindDemoWeb.ConnCase

  import LiveviewTailwindDemo.AccountsFixtures

  @create_attrs %{end: ~T[14:00:00], limit: 42, start: ~D[2021-12-20], tags: [], title: "some title"}
  @update_attrs %{end: ~T[15:01:01], limit: 43, start: ~D[2021-12-21], tags: [], title: "some updated title"}
  @invalid_attrs %{end: nil, limit: nil, start: nil, tags: nil, title: nil}

  describe "index" do
    test "lists all subscriptions", %{conn: conn} do
      conn = get(conn, Routes.subscription_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Subscriptions"
    end
  end

  describe "new subscription" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.subscription_path(conn, :new))
      assert html_response(conn, 200) =~ "New Subscription"
    end
  end

  describe "create subscription" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.subscription_path(conn, :create), subscription: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.subscription_path(conn, :show, id)

      conn = get(conn, Routes.subscription_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Subscription"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.subscription_path(conn, :create), subscription: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Subscription"
    end
  end

  describe "edit subscription" do
    setup [:create_subscription]

    test "renders form for editing chosen subscription", %{conn: conn, subscription: subscription} do
      conn = get(conn, Routes.subscription_path(conn, :edit, subscription))
      assert html_response(conn, 200) =~ "Edit Subscription"
    end
  end

  describe "update subscription" do
    setup [:create_subscription]

    test "redirects when data is valid", %{conn: conn, subscription: subscription} do
      conn = put(conn, Routes.subscription_path(conn, :update, subscription), subscription: @update_attrs)
      assert redirected_to(conn) == Routes.subscription_path(conn, :show, subscription)

      conn = get(conn, Routes.subscription_path(conn, :show, subscription))
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, subscription: subscription} do
      conn = put(conn, Routes.subscription_path(conn, :update, subscription), subscription: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Subscription"
    end
  end

  describe "delete subscription" do
    setup [:create_subscription]

    test "deletes chosen subscription", %{conn: conn, subscription: subscription} do
      conn = delete(conn, Routes.subscription_path(conn, :delete, subscription))
      assert redirected_to(conn) == Routes.subscription_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.subscription_path(conn, :show, subscription))
      end
    end
  end

  defp create_subscription(_) do
    subscription = subscription_fixture()
    %{subscription: subscription}
  end
end
