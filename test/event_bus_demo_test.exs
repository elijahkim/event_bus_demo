defmodule EventBusDemoTest do
  use ExUnit.Case
  doctest EventBusDemo

  test "greets the world" do
    assert EventBusDemo.hello() == :world
  end
end
