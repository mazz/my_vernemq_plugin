defmodule MyVMQPluginTest do
  use ExUnit.Case
  doctest MyVMQPlugin

  test "greets the world" do
    assert MyVMQPlugin.hello() == :world
  end
end
