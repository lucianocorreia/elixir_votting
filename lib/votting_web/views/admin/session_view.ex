defmodule VottingWeb.Admin.SessionView do
  use VottingWeb, :view

  def render("session.json", %{admin: admin}) do
    %{status: "ok", data: %{name: admin.name}}
  end
end
