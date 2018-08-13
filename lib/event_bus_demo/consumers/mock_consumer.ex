defmodule EventBusDemo.MockConsumer do
  use GenServer
  import Logger

  def init(pid) do
    {:ok, pid}
  end

  def handle_call({:message, message}, _from, pid) do
    Process.sleep(1_000)
    Process.send(pid, message, [])

    {:reply, :ok, pid}
  end
end
