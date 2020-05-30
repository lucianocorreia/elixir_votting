defmodule VottingWeb.Admin.SessionController do
  use VottingWeb, :controller

  alias Votting.SignInAdmin
  alias VottingWeb.Guardian

  def create(conn, %{"email" => email, "password" => password}) do
    case SignInAdmin.run(email, password) do
      {:ok, admin} ->
        {:ok, token, _claims} = Guardian.encode_and_sign(admin)
        render(conn, "session.json", %{admin: admin, token: token})

      {:error, _} ->
        conn
        |> put_status(401)
        |> json(%{status: "unauthenticated"})
    end
  end
end
