defmodule UnderstandingModulesTest do
  use ExUnit.Case
  doctest UnderstandingModules

  test "function from use" do
    assert UnderstandingModules.function_from_use === :use
  end

  @tag :skip
  test "function from import" do
    assert UnderstandingModules.function_from_import === :import
  end

  test "function that has been aliased but has no preceding namespace" do
    
  end
end
