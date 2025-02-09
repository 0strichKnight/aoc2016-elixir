defmodule Aoc2016elixirTest.Day01 do
  use ExUnit.Case
  import ParameterizedTest
  doctest Aoc2016elixir.Day01

  param_test "do part 01 with sample input",
             """
             | steps                    | distance |
             |--------------------------|----------|
             | ["R2", "L3"]             | 5        |
             | ["R2", "R2", "R2"]       | 2        |
             | ["R5", "L5", "R5", "R3"] | 12       |
             """,
             %{steps: steps, distance: distance} do
    assert Aoc2016elixir.Day01.dopart01(steps) == distance
  end
end
