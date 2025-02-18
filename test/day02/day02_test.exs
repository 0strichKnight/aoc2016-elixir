defmodule Aoc2016elixirTest.Day02 do
  use ExUnit.Case
  doctest Aoc2016elixir.Day02
  alias Aoc2016elixir.Day02
  alias Aoc2016elixir.Input

  test "do part 01 with sample input" do
    lines = Input.parse_input_as_lines("test/0202.txt")
    assert Day02.do_part1(lines) == [1, 9, 8, 5]
  end

  test "do part 02 with sample input" do
    lines = Input.parse_input_as_lines("test/0202.txt")
    assert Day02.do_part2(lines) == [5, "D", "B", 3]
  end
end
