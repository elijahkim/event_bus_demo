for i <- 1..1_000 do
  {:ok, pid} = GenServer.start_link(EventBusDemo.MockConsumer, self())

  EventBusDemo.subscribe(pid)
end

Benchee.run(%{
  "basic_bus" => fn ->
    for event <- 1..1_000_000 do
      EventBusDemo.broadcast("event #{event}")
    end
  end,
})
