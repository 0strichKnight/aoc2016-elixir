defmodule Aoc2016elixir.Day03 do
  @moduledoc """
  Day 3 - Squares With Three Sides
  (https://adventofcode.com/2016/day/3)
  """

  def do_part01() do
    read_input()
    |> do_part01()
  end

  def do_part01(lines) do
    lines
    |> Enum.map(&is_valid_triangle/1)
    |> Enum.count(fn is_valid -> is_valid end)
  end

  defp is_valid_triangle(sides) do
    [a, b, c] =
      sides
      |> Enum.map(&String.to_integer/1)

    a + b > c && a + c > b && b + c > a
  end

  def read_input() do
    Path.join(:code.priv_dir(:aoc2016elixir), "input/day03.txt")
    |> File.stream!()
    |> Enum.map(&Regex.scan(~r/\d+/, &1))
    |> Enum.map(&List.flatten/1)
  end
end
