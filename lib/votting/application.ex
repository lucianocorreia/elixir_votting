defmodule Votting.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Votting.Repo,
      # Start the Telemetry supervisor
      VottingWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Votting.PubSub},
      # Start the Endpoint (http/https)
      VottingWeb.Endpoint
      # Start a worker by calling: Votting.Worker.start_link(arg)
      # {Votting.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Votting.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    VottingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
