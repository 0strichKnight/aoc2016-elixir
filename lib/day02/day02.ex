defmodule Aoc2016elixir.Day02 do
  @moduledoc """
  Day 2 - Bathroom Security
  (https://adventofcode.com/2016/day/2)
  """

  alias Aoc2016elixir.Input

  @input_file "input/day02.txt"

  @key_pad %{
    {1, 1} => 1,
    {1, 2} => 2,
    {1, 3} => 3,
    {2, 1} => 4,
    {2, 2} => 5,
    {2, 3} => 6,
    {3, 1} => 7,
    {3, 2} => 8,
    {3, 3} => 9
  }

  def doit() do
    lines = Input.parse_input_as_lines(@input_file)
    find_number_from_directions({2, 2}, lines, [])
  end

  def doit(lines) do
    find_number_from_directions({2, 2}, lines, [])
  end

  defp find_number_from_directions({r, c}, [head | tail], pressed) do
    {next_r, next_c} = find_next_number({r, c}, head)
    next_button = @key_pad[{next_r, next_c}]
    find_number_from_directions({next_r, next_c}, tail, pressed ++ [next_button])
  end

  defp find_number_from_directions(_from_number, [], pressed), do: pressed

  defp find_next_number({r, c}, [head | tail]) do
    {next_r, next_c} = move_button({r, c}, head)
    find_next_number({next_r, next_c}, tail)
  end

  defp find_next_number(from_number, []), do: from_number

  defp move_button({r, 1}, "L"), do: {r, 1}
  defp move_button({r, 3}, "R"), do: {r, 3}
  defp move_button({1, c}, "U"), do: {1, c}
  defp move_button({3, c}, "D"), do: {3, c}
  defp move_button({r, c}, "L"), do: {r, c - 1}
  defp move_button({r, c}, "R"), do: {r, c + 1}
  defp move_button({r, c}, "U"), do: {r - 1, c}
  defp move_button({r, c}, "D"), do: {r + 1, c}
  defp move_button({r, c}, _anything), do: {r, c}
end
