defmodule EventBusDemo do
  @moduledoc """
  Documentation for EventBusDemo.
  """

  alias EventBusDemo.EventBus

  def get_subscribers() do
    GenStage.call(EventBus, :get_subscribers)
  end

  def subscribe(pid) do
    GenStage.sync_subscribe(pid, to: EventBus)
  end

  def broadcast(event) do
    GenStage.call(EventBus, {:notify, event}, :infinity)
  end
end
