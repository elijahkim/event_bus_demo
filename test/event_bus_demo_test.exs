defmodule EventBusDemoTest do
  use ExUnit.Case
  doctest EventBusDemo

  describe "#get_subscribers" do
    test "It gets the list of subscribers" do
      subs = EventBusDemo.get_subscribers()

      assert subs == []
    end
  end

  describe "#subscribe" do
    test "It subscribes the pid to receive messages" do
      :ok = EventBusDemo.subscribe(self())

      subs = EventBusDemo.get_subscribers()

      assert subs == [self()]
    end
  end

  describe "#broadcast" do
    test "It broadcasts to all subscribed pids" do
      :ok = EventBusDemo.subscribe(self())

      EventBusDemo.broadcast(:hello_world)

      assert_receive :hello_world
    end
  end
end
