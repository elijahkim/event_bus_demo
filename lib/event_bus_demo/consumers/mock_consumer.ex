defmodule EventBusDemo.MockConsumer do
  use GenStage

  def start_link(pid) do
    GenStage.start_link(__MODULE__, pid)
  end

  # Callbacks

  def init(pid) do
    # Starts a permanent subscription to the broadcaster
    # which will automatically start requesting items.
    {:consumer, pid}
  end

  def handle_events(events, _from, pid) do
    :timer.sleep(100)

    for event <- events do
      Process.send(pid, event, [])
    end

    {:noreply, [], pid}
  end
end
