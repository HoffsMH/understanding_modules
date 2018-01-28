defmodule UnderstandingModules do
  @moduledoc """
  Documentation for UnderstandingModules.
  """

  @doc ~S"""
  Parses the given `line` into a command.

  ## Examples

      iex> UnderstandingModules.top_level_alias_wrapper
      :toplevel_alias

      iex> UnderstandingModules.top_level_alias_wrapper_with_as
      :toplevel_alias

  """

  # this basically does nothing
  alias AliasMe

  alias AliasMe, as: Taco
  
  use UseMe
  
  import ImportMe

  #notice that both of these work
  def top_level_alias_wrapper do
    AliasMe.function_from_toplevel_alias
  end
  def top_level_alias_wrapper_with_as do
    Taco.function_from_toplevel_alias
  end
end
