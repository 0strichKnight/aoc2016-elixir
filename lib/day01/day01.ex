defmodule Aoc2016elixir.Day01 do
  @moduledoc """
  Day 1 - No Time for a Taxicab
  (https://adventofcode.com/2016/day/1)
  """

  def part01() do
    input =
      Path.join(:code.priv_dir(:aoc2016elixir), "day01.txt")
      |> File.stream!()
      |> Enum.map(&String.split(&1, ","))
      |> Enum.at(0)
      |> Enum.map(&String.trim/1)

    dopart01(input)
  end

  def dopart01(steps) do
    calculate_distance(steps, :north, 0, 0)
  end

  defp calculate_distance([head | tail], orientation, x, y) do
    {direction, blocks} = String.split_at(head, 1)
    {orientation, x, y} = move(orientation, direction, x, y, String.to_integer(blocks))
    calculate_distance(tail, orientation, x, y)
  end

  defp calculate_distance([], _orientation, x, y), do: abs(x) + abs(y)

  defp move(:north, "L", x, y, blocks), do: {:west, x - blocks, y}
  defp move(:north, "R", x, y, blocks), do: {:east, x + blocks, y}
  defp move(:south, "L", x, y, blocks), do: {:east, x + blocks, y}
  defp move(:south, "R", x, y, blocks), do: {:west, x - blocks, y}
  defp move(:east, "L", x, y, blocks), do: {:north, x, y + blocks}
  defp move(:east, "R", x, y, blocks), do: {:south, x, y - blocks}
  defp move(:west, "L", x, y, blocks), do: {:south, x, y - blocks}
  defp move(:west, "R", x, y, blocks), do: {:north, x, y + blocks}
end
