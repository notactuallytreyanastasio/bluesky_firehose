defmodule BlueskyHoseTest do
  use ExUnit.Case
  doctest BlueskyHose

  test "greets the world" do
    assert BlueskyHose.hello() == :world
  end
end
