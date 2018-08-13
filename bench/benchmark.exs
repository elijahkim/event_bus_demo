for _i <- 1..10 do
  {:ok, pid} = GenStage.start_link(EventBusDemo.MockConsumer, self())

  EventBusDemo.subscribe(pid)
end

Benchee.run(%{
  "basic_bus" => fn ->
    for _i <- 1..100 do
      EventBusDemo.broadcast(:hello_world)
    end
  end
})
