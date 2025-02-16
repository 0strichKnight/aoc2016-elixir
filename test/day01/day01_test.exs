defmodule Aoc2016elixirTest.Day01 do
  use ExUnit.Case
  import ParameterizedTest
  doctest Aoc2016elixir.Day01
  alias Aoc2016elixir.Day01

  param_test "do part 01 with sample input",
             """
             | steps                    | distance |
             |--------------------------|----------|
             | ["R2", "L3"]             | 5        |
             | ["R2", "R2", "R2"]       | 2        |
             | ["R5", "L5", "R5", "R3"] | 12       |
             """,
             %{steps: steps, distance: distance} do
    assert Day01.Part01.doit(steps) == distance
  end

  param_test "do part 02 with sample input",
             """
             | steps                    | distance |
             |--------------------------|----------|
             | ["R8", "R4", "R4", "R8"] | 4        |
             """,
             %{steps: steps, distance: distance} do
    assert Day01.Part02.doit(steps) == distance
  end
end
