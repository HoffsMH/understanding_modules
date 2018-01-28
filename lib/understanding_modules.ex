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

      iex> UnderstandingModules.import_wrapper_from_toplevel
      :import

      iex> UnderstandingModules.Nested.nestedFunction
      :this_is_nested

      iex> UnderstandingModules.some_other_split "hi"
      ["hi"]

      iex> UnderstandingModules.split "hi"
      ["hi"]
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

  # this makes the functions available in this module but not from without
  # and its still not possible to call something like
  # UnderstandingModules.ImportMe.function_from_import
  import ImportMe

  # This does not error even though this file isn't anywhere
  alias Aalkdflaksjdfllkjasdf

  # This WILL error however
  # import Asldkjasldfkjasf

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

  # this still doesnt get us to accessing this function from the outside
  def import_wrapper_from_toplevel do
    function_from_import()
  end

  defmodule Nested do
    def nestedFunction do
      :this_is_nested
    end
  end

  # looks like we still need to specify arity when using this method
  defdelegate some_other_split(asdf), to: String.Break, as: :split

  # basically this is a public "import"
  defdelegate split(asdf), to: String.Break
end
