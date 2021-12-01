defmodule Mix.Tasks.Day1 do
  use Mix.Task

  @shortdoc "Runs the day 1 problem."
  def run(_), do: Advent2021.Day1.main()
end
