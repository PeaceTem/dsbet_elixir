# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config


### This App is meant to be built for fun and learning, so don't rush it!
# No Server, No Database ( It's a peer-to-peer network; use distributed systems concepts like paxos )
# Create A Live Chatting App That's Distributed
# Home Page will be the list of all the servers(rooms) a user belongs to.
# There will be a CREATE ROOM button on the home page
# Save messages to KVBucket that's distributed across all devices on the same server


# KVBucket


# Handle Software Updates synchronization






# UeberAuth OAuth-2 Connfiguration

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, []}
  ]

# UeberAuth Google OAuth Configuration
config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")
  

config :dsbet,
  namespace: DSBet,
  ecto_repos: [DSBet.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :dsbet, DSBetWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: DSBetWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: DSBet.PubSub,
  live_view: [signing_salt: "ueNkdzGE"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :dsbet, DSBet.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
