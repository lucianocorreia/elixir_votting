defmodule VottingWeb.Admin.SessionControllerTest do
  use VottingWeb.ConnCase, async: true

  import Votting.Factory

  describe "create/2" do
    setup %{conn: conn} do
      insert(:admin, name: "Luciano Correia", email: "luciano@luciano.com")
      %{conn: conn}
    end

    test "returns 200 when admin credentials are valid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/signin", %{
          "email" => "luciano@luciano.com",
          "password" => "123456"
        })

      assert %{"status" => "ok", "data" => %{"name" => "Luciano Correia", "token" => _token}} =
               json_response(conn, 200)
    end

    test "returns 401 when admin email is invalid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/signin", %{
          "email" => "erro@luciano.com",
          "password" => "123456"
        })

      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end

    test "returns 401 when admin password is invalid", %{conn: conn} do
      conn =
        post(conn, "/api/v1/admin/signin", %{
          "email" => "luciano@luciano.com",
          "password" => "12345698"
        })

      assert %{"status" => "unauthenticated"} = json_response(conn, 401)
    end
  end
end
