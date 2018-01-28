defmodule UseMe do

  def goodbye do
    IO.puts "ok"
    :ok
  end

  defmacro __using__(_) do
    quote do
      def goodbye do
        UseMe.goodbye
      end
    end
  end
end
