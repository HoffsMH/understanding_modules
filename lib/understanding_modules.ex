defmodule UnderstandingModules do
  @moduledoc """
  Documentation for UnderstandingModules.
  """

  @doc """
      iex> UnderstandingModules.top_level_alias_wrapper
      :toplevel_alias

      iex> UnderstandingModules.top_level_alias_wrapper_with_as
      :toplevel_alias

      iex> UnderstandingModules.alias_wrapper
      :function_from_alias

      iex> UnderstandingModules.alias_wrapper_two
      :function_from_alias

      iex> UnderstandingModules.alias_wrapper_three
      :function_from_alias
  """

  # this wont execute
  @taco """
      iex> UnderstandingModules.alias_wrapper_two
      :function_from_alias
  """

  # this basically does nothing
  alias AliasMe

  alias AliasMe, as: Taco

  alias SomeNamespace.AliasMeTo, as: SomethingElse

  
  use UseMe
  
  import ImportMe

  #notice that both of these work
  def top_level_alias_wrapper do
    AliasMe.function_from_toplevel_alias
  end
  def top_level_alias_wrapper_with_as do
    Taco.function_from_toplevel_alias
  end

  # notice that this works even though the directory names aren't
  # matching. It appears that everything is available

  def alias_wrapper do
    SomeNamespace.AliasMeTo.function_from_alias
  end

  def alias_wrapper_two do
    SomethingElse.function_from_alias
  end

  # lexical scoping example
  def alias_wrapper_three do
    alias SomeNamespace.AliasMeTo, as: Ok
    Ok.function_from_alias
  end
end
