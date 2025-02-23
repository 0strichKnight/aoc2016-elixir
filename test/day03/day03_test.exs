defmodule Aoc2016elixirTest.Day03 do
  use ExUnit.Case
  doctest Aoc2016elixir.Day03
  alias Aoc2016elixir.Day03

  test "do part 01 with sample input" do
    assert Day03.do_part01([["5", "10", "25"]]) == 0
  end
end
