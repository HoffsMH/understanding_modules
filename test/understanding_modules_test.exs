defmodule UnderstandingModulesTest do
  use ExUnit.Case
  @um UnderstandingModules

  doctest @um

  test "function from use" do
    assert @um.function_from_use === :use
  end

  @tag :skip
  test "function from import" do
    assert @um.function_from_import === :import
  end

  test "function that has been aliased but has no preceding namespace" do
    assert @um.top_level_alias_wrapper === :toplevel_alias
  end
end
