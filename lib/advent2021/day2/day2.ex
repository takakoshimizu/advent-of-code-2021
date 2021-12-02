defmodule Advent2021.Day2 do
  use Advent2021.Utils
  alias Advent2021.Answer

  def main() do
    directions = input() |> parse_directions()
    {xs, ys} = Enum.unzip(directions)

    sum_xs = Enum.sum(xs)
    sum_ys = Enum.sum(ys)
    {x_aim, y_aim, _aim} = parse_aim(directions)

    answer(Answer.new(sum_xs * sum_ys, x_aim * y_aim))
  end

  def parse_directions(list), do: list |> Enum.map(&parse_direction/1)

  def parse_direction(str) do
    [direction, num] = String.split(str, " ", trim: true)
    move_amount = String.to_integer(num)

    case direction do
      "up" -> {0, -move_amount}
      "down" -> {0, move_amount}
      "forward" -> {move_amount, 0}
    end
  end

  def parse_aim(list), do: Enum.reduce(list, {0, 0, 0}, &parse_aim/2)
  def parse_aim({x, y}, {x_pos, y_pos, aim}) when x == 0, do: {x_pos, y_pos, aim + y}
  def parse_aim({x, _y}, {x_pos, y_pos, aim}), do: {x_pos + x, y_pos + (x * aim), aim}
end
