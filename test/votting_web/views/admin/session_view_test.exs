defmodule VottingWeb.Admin.SessionViewTest do
  use ExUnit.Case, async: true

  alias VottingWeb.Admin.SessionView

  import Votting.Factory

  test "render/2 returns ok and the admin data" do
    # admin = params_for(:admin, name: "Nome Diferente")
    admin = params_for(:admin)

    assert %{status: "ok", data: %{name: "Luciano Correia"}} =
             SessionView.render("session.json", %{admin: admin})
  end
end
