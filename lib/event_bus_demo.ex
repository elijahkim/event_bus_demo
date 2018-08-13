defmodule EventBusDemo do
  @moduledoc """
  Documentation for EventBusDemo.
  """

  alias EventBusDemo.EventBus

  def get_subscribers() do
    GenServer.call(EventBus, :get_subscribers)
  end

  def subscribe(pid) do
    GenServer.cast(EventBus, {:subscribe, pid})
  end

  def broadcast(message) do
    GenServer.call(EventBus, {:broadcast, message})
  end
end
