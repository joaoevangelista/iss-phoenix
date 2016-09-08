# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :iss_location,
  namespace: ISS

# Configures the endpoint
config :iss_location, ISS.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7DfXsHQfzCkYWz2uKfEqO6mzfXyd62zHFP7wW7NY/pigSNgA/fJIorrWUMVDqQHt",
  render_errors: [view: ISS.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ISS.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
