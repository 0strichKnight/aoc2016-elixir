defmodule Aoc2016elixir.Day02 do
  @moduledoc """
  Day 2 - Bathroom Security
  (https://adventofcode.com/2016/day/2)
  """

  alias Aoc2016elixir.Input

  @input_file "input/day02.txt"

  @key_pad_1 %{
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

  def do_part1() do
    lines = Input.parse_input_as_lines(@input_file)
    find_number_from_directions({2, 2}, lines, [], @key_pad_1)
  end

  def do_part1(lines) do
    find_number_from_directions({2, 2}, lines, [], @key_pad_1)
  end

    lines = Input.parse_input_as_lines(@input_file)
    find_number_from_directions({2, 2}, lines, [])
  end

  def doit(lines) do
    find_number_from_directions({2, 2}, lines, [])
  end

  defp find_number_from_directions({r, c}, [head | tail], pressed, key_pad) do
    {next_r, next_c} = find_next_number({r, c}, head, key_pad)
    next_button = key_pad[{next_r, next_c}]
    find_number_from_directions({next_r, next_c}, tail, pressed ++ [next_button], key_pad)
  end

  defp find_number_from_directions(_from_number, [], pressed, _key_pad), do: pressed

  defp find_next_number({r, c}, [head | tail], key_pad) do
    {next_r, next_c} = move_button({r, c}, head, key_pad)
    find_next_number({next_r, next_c}, tail, key_pad)
  end

  defp find_next_number(from_number, [], _key_pad), do: from_number

  defp move_button({r, c}, "L", key_pad), do: move({r, c}, {r, c - 1}, key_pad)
  defp move_button({r, c}, "R", key_pad), do: move({r, c}, {r, c + 1}, key_pad)
  defp move_button({r, c}, "U", key_pad), do: move({r, c}, {r - 1, c}, key_pad)
  defp move_button({r, c}, "D", key_pad), do: move({r, c}, {r + 1, c}, key_pad)
  defp move_button({r, c}, _invalid, _key_pad), do: {r, c}

  defp move({from_r, from_c}, {to_r, to_c}, key_pad) do
    case Map.has_key?(key_pad, {to_r, to_c}) do
      true -> {to_r, to_c}
      _ -> {from_r, from_c}
    end
  end
end
