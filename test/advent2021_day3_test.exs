defmodule Advent2021Day3Test do
  use ExUnit.Case
  alias Advent2021.Day3
  doctest Advent2021.Day3
  @moduletag :day3

  @input \
    ~S[00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010]
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)

  describe "parse_line" do
    test "should parse" do
      out = @input |> Enum.at(0) |> Day3.parse_line()
      assert out == [0, 0, 1, 0, 0]
    end
  end

  describe "zip lines" do
    test "should zip" do
      out = @input |> Enum.map(&Day3.parse_line/1) |> Day3.zip_lines()
      assert Enum.count(out) == 5
      assert Enum.count(Enum.at(out, 0)) == 12
    end
  end

  describe "most common" do
    test "should pull common" do
      line = @input |> Enum.map(&Day3.parse_line/1) |> Day3.zip_lines() |> Enum.at(0)
      out = Day3.most_common(line)
      assert out == 1
    end
  end
end
