defmodule Votting.AdminRepo do
  @moduledoc """
  Admin repository
  """

  alias Votting.{Admin, Repo}

  def get_admin!(id) do
    Repo.get!(Admin, id)
  end
end
