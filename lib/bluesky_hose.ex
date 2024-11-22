defmodule BlueskyHose do
  use WebSockex
  require Logger

  def start_link(opts \\ []) do
    WebSockex.start_link("wss://bsky-relay.c.theo.io/subscribe?wantedCollections=app.bsky.feed.post", __MODULE__, :fake_state, opts)
  end

  def handle_connect(_conn, state) do
    Logger.info("Connected!")
    {:ok, state}
  end

  def handle_frame({:text, msg}, :fake_state) do
    Logger.info("Received post: #{msg}")
    msg = Jason.decode!(msg)
    case msg do
      %{"commit" => %{"record" => %{"text" => skeet}}} ->
        if String.contains?(skeet, "sky") do
          IO.puts (skeet)
        end
      _ -> :no_butts_discard_skeet
    end

    {:ok, :fake_state}
  end

  def handle_disconnect(%{reason: {:local, reason}}, state) do
    Logger.info("Local close with reason: #{inspect reason}")
    {:ok, state}
  end
  
  def handle_disconnect(disconnect_map, state) do
    super(disconnect_map, state)
  end
end
