defmodule UseMe do
  def function_from_use do
    :use
  end

  defmacro __using__(_) do
    quote do
      # lets see if I get rid of
      # this
      def function_from_use do
        UseMe.function_from_use
      end
    end
  end
end
