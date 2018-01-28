defmodule UnderstandingModulesTest do
  use ExUnit.Case
  doctest UnderstandingModules

  test "stuff" do
    assert UnderstandingModules.goodbye === :ok
  end
end
