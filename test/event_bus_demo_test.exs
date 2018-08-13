defmodule EventBusDemoTest do
  use ExUnit.Case
  doctest EventBusDemo

  describe "#get_subscribers" do
    test "It gets the list of subscribers" do
      subs = EventBusDemo.get_subscribers()

      assert subs == []
    end
  end
end
