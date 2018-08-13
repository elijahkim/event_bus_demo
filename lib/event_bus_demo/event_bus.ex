defmodule EventBusDemo.EventBus do
  use GenServer

  @name __MODULE__

  def start_link([]) do
    GenServer.start_link(@name, [], name: @name)
  end

  def init([]) do
    {:ok, %{subscribers: []}}
  end

  def handle_call(:get_subscribers, _from, %{subscribers: subs} = state) do
    {:reply, subs, state}
  end

  def handle_cast({:subscribe, pid}, %{subscribers: subs} = state) do
    subs = [pid | subs]
    {:noreply, %{state | subscribers: subs}}
  end

  def handle_cast({:broadcast, message}, %{subscribers: subs} = state) do
    for sub <- subs do
      :ok = GenServer.call(sub, {:message, message})
    end

    {:noreply, state}
  end
end
