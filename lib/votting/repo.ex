defmodule Votting.Repo do
  use Ecto.Repo,
    otp_app: :votting,
    adapter: Ecto.Adapters.Postgres
end
