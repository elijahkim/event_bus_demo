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

  def handle_call({:broadcast, message}, _from, %{subscribers: subs} = state) do
    subs
    |> Task.async_stream(fn sub ->
      :ok = GenServer.call(sub, {:message, message})
    end)
    |> Stream.run()

    {:reply, :ok, state}
  end

  def handle_cast({:subscribe, pid}, %{subscribers: subs} = state) do
    subs = [pid | subs]

    {:noreply, %{state | subscribers: subs}}
  end
end
