defmodule DSBet.Repo do
  use Ecto.Repo,
    otp_app: :dsbet,
    adapter: Ecto.Adapters.MyXQL
    # adapter: Ecto.Adapters.Postgres
end


### This App is meant to be built for fun and learning, so don't rush it!
# No Server, No Database ( It's a peer-to-peer network; use distributed systems concepts like paxos )
# Create A Live Chatting App That's Distributed
# Home Page will be the list of all the servers(rooms) a user belongs to.
# There will be a CREATE ROOM button on the home page
# Save messages to KVBucket that's distributed across all devices on the same server


# KVBucket


# Handle Software Updates synchronization
