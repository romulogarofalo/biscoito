# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :biscoito,
  ecto_repos: [Biscoito.Repo]

# Configures the endpoint
config :biscoito, BiscoitoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Hf6HDA8/oJ9QwldSemPdO6j/0yvkmbYwqina5bCL94JxWo65r9h9htNvF7p2Um54",
  render_errors: [view: BiscoitoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Biscoito.PubSub,
  live_view: [signing_salt: "OfPOtuIv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
