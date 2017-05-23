# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :petsgo,
  ecto_repos: [Petsgo.Repo]

# Configures the endpoint
config :petsgo, Petsgo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UYHYselVfaJEfo1vTVAeT6WO2IAUhSBKAH/lobkGFoCkHxEXzEHT6dZf3gS37lcA",
  render_errors: [view: Petsgo.ErrorView, accepts: ~w(json)],
  pubsub: [name: Petsgo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Guardian
config :guardian, Guardian,
  issuer: "Petsgo",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Petsgo.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
