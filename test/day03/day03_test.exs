defmodule Aoc2016elixirTest.Day03 do
  use ExUnit.Case
  doctest Aoc2016elixir.Day03
  alias Aoc2016elixir.Day03

  test "do part 01 with sample input" do
    assert Day03.do_part01([["5", "10", "25"]]) == 0
  end

  test "do part 02 with sample input array" do
    input_array =
      Arrays.new([
        "101",
        "301",
        "501",
        "102",
        "302",
        "502",
        "103",
        "303",
        "503",
        "201",
        "401",
        "601",
        "202",
        "402",
        "602",
        "203",
        "403",
        "603"
      ])

    assert Day03.do_part02(input_array) == 6
  end
end
