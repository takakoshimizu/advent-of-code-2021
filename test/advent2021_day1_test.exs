defmodule Advent2021Day1Test do
  use ExUnit.Case
  alias Advent2021.Day1
  doctest Advent2021.Day1
  @moduletag :day1

  @input \
    ~S[199
    200
    208
    210
    200
    207
    240
    269
    260
    263]
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)

  describe "increases" do
    test "returns correct number of increases" do
      increases = Day1.count_increases(@input)
      assert increases == 7
    end

    test "returns correct number of sliding increases" do
      increases = Day1.count_sliding_increases(@input)
      assert increases == 5
    end
  end
end
