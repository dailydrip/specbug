defmodule SpecbugTest do
  use ExUnit.Case
  doctest Specbug

  test "greets the world" do
    assert Specbug.hello() == :world
  end
end
