defmodule VottingWeb.Admin.SessionView do
  use VottingWeb, :view

  def render("session.json", %{admin: admin, token: token}) do
    %{status: "ok", data: %{name: admin.name, token: token}}
  end
end
