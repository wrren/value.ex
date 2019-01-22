defmodule ValueTest do
  use ExUnit.Case
  doctest Value

  test "greets the world" do
    assert Value.hello() == :world
  end
end
