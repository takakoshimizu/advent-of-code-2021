defmodule Advent2021.Day3 do
  use Advent2021.Utils
  alias Advent2021.Answer

  def main() do
    lines = input() |> Enum.map(&parse_line/1)
    zipped = lines |> zip_lines()
    commons = zipped |> Enum.map(&most_common/1)
    uncommon = commons |> Enum.map(&flip/1)

    answer Answer.new(to_num(commons) * to_num(uncommon), 0)
  end

  def parse_line(line), do: String.split(line, "", trim: true) |> Enum.map(&String.to_integer/1)
  def zip_lines(lines), do: lines |> Enum.zip() |> Enum.map(&Tuple.to_list/1)
  def most_common(zipped), do: zipped |> Enum.frequencies() |> Enum.max_by(&(elem(&1, 1))) |> then(&tuple_get/1)
  def to_num(list), do: list |> Enum.join("") |> String.to_integer(2)
  defp tuple_get({x, _}), do: x
  def flip(0), do: 1
  def flip(1), do: 0
end
