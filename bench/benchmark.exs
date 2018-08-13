for i <- 1..10_000 do
  EventBusDemo.subscribe(self())
end

Benchee.run(%{
  "basic_bus" => fn ->
    for event <- 1..10_000 do
      EventBusDemo.broadcast("event #{event}")
    end
  end,
})
