defmodule Aoc2016elixir.Day02 do
  @moduledoc """
  Day 2 - Bathroom Security
  (https://adventofcode.com/2016/day/2)
  """

  alias Aoc2016elixir.Input

  @input_file "input/day02.txt"

  @key_pad_1_arr Arrays.new([
                   Arrays.new([1, 2, 3]),
                   Arrays.new([4, 5, 6]),
                   Arrays.new([7, 8, 9])
                 ])

  @key_pad_2_arr Arrays.new([
                   Arrays.new([0, 0, 1, 0, 0]),
                   Arrays.new([0, 2, 3, 4, 0]),
                   Arrays.new([5, 6, 7, 8, 9]),
                   Arrays.new([0, "A", "B", "C", 0]),
                   Arrays.new([0, 0, "D", 0, 0])
                 ])

  def do_part1() do
    lines = Input.parse_input_as_lines(@input_file)
    find_number_from_directions({1, 1}, lines, [], @key_pad_1_arr)
  end

  def do_part1(lines) do
    find_number_from_directions({1, 1}, lines, [], @key_pad_1_arr)
  end

  def do_part2() do
    lines = Input.parse_input_as_lines(@input_file)
    find_number_from_directions({2, 0}, lines, [], @key_pad_2_arr)
  end

  def do_part2(lines) do
    find_number_from_directions({2, 0}, lines, [], @key_pad_2_arr)
  end

  defp find_number_from_directions({r, c}, [head | tail], pressed, key_pad) do
    {next_r, next_c} = find_next_number({r, c}, head, key_pad)
    next_button = key_pad[next_r][next_c]
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

  defp move({from_r, from_c}, {-1, _to_c}, _key_pad), do: {from_r, from_c}
  defp move({from_r, from_c}, {_to_r, -1}, _key_pad), do: {from_r, from_c}

  defp move({from_r, from_c}, {to_r, to_c}, key_pad) do
    case key_pad[to_r][to_c] do
      nil -> {from_r, from_c}
      0 -> {from_r, from_c}
      _ -> {to_r, to_c}
    end
  end
end
