defmodule Aoc2016elixir.Day01 do
  @moduledoc """
  Day 1 - No Time for a Taxicab
  (https://adventofcode.com/2016/day/1)
  """

  @input_file "input/day01.txt"
  def input_file, do: @input_file

  def move(:north, "L", x, y, blocks), do: {:west, x - blocks, y}
  def move(:north, "R", x, y, blocks), do: {:east, x + blocks, y}
  def move(:south, "L", x, y, blocks), do: {:east, x + blocks, y}
  def move(:south, "R", x, y, blocks), do: {:west, x - blocks, y}
  def move(:east, "L", x, y, blocks), do: {:north, x, y + blocks}
  def move(:east, "R", x, y, blocks), do: {:south, x, y - blocks}
  def move(:west, "L", x, y, blocks), do: {:south, x, y - blocks}
  def move(:west, "R", x, y, blocks), do: {:north, x, y + blocks}
end
