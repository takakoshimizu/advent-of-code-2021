defmodule Advent2021.Day1 do
  use Advent2021.Utils
  alias Advent2021.Answer

  def main do
    data = input() |> Enum.map(&String.to_integer/1)
    n_increases = count_increases(data)
    n_sliding_increases = count_sliding_increases(data)
    answer(Answer.new(n_increases, n_sliding_increases))
  end

  def count_increases(list) do
    list
      |> Enum.chunk_every(2, 1)
      |> Enum.map(&increases?/1)
      |> Enum.sum()
  end

  def count_sliding_increases(list) do
    list
      |> Enum.chunk_every(3, 1, :discard)
      |> Enum.map(&Enum.sum/1)
      |> Enum.chunk_every(2, 1)
      |> Enum.map(&increases?/1)
      |> Enum.sum()
  end

  def increases?([prev, next]) when is_number(prev) and is_number(next) and prev < next, do: 1
  def increases?([_prev, _next]), do: 0
  def increases?(_any), do: 0
end
