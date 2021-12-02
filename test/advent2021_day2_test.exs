defmodule Advent2021Day2Test do
  use ExUnit.Case
  alias Advent2021.Day2
  doctest Advent2021.Day2
  @moduletag :day2

  @input \
    ~S[forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2]
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim/1)

  describe "parse" do
    test "parses forward" do
      {x, _y} = Day2.parse_direction("forward 5")
      @input
      assert x == 5
    end

    test "parses up" do
      {_x, y} = Day2.parse_direction("up 8")
      assert y == -8
    end

    test "parses down" do
      {_x, y} = Day2.parse_direction("down 10")
      assert y == 10
    end

    test "parses list" do
      out = Day2.parse_directions(@input)
      assert out == [{5, 0}, {0, 5}, {8, 0}, {0, -3}, {0, 8}, {2, 0}]
    end
  end

  describe "aim" do
    test "parses aim as expected" do
      directions = Day2.parse_directions(@input)
      {x, y, _aim} = Day2.parse_aim(directions)
      assert x == 15
      assert y == 60
    end
  end
end
