defmodule Votting.SignInAdminTest do
  use Votting.DataCase, async: true

  import Votting.Factory

  alias Votting.{Admin, SignInAdmin}

  describe "run/2" do
    setup do
      insert(:admin)
      :ok
    end

    test "returns ok when email and password match" do
      assert {:ok, %Admin{}} = SignInAdmin.run("luciano@luciano.com", "123456")
    end

    test "returns error when there is no admin with this email" do
      assert {:error, :email_or_password_invalid} = SignInAdmin.run("foo@luciano.com", "123456")
    end

    test "return error when the passwod is invalid" do
      assert {:error, :email_or_password_invalid} =
               SignInAdmin.run("luciano@luciano.com", "12345678")
    end
  end
end
