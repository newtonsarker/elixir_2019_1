defmodule Elixir20191.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Elixir20191.Repo,
      # Start the Telemetry supervisor
      Elixir20191Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Elixir20191.PubSub},
      # Start the Endpoint (http/https)
      Elixir20191Web.Endpoint
      # Start a worker by calling: Elixir20191.Worker.start_link(arg)
      # {Elixir20191.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Elixir20191.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Elixir20191Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
