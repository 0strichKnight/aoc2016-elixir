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

  def do_part02() do
    read_input()
    |> List.flatten()
    |> Enum.into(Arrays.new())
    |> do_part02()
  end

  def do_part02(input_array) do
    check_triangle(0, input_array, 0)
  end

  defp check_triangle(index, input_array, total) do
    cond do
      input_array[index] == "X" -> check_triangle(index + 1, input_array, total)
      index + 6 >= Arrays.size(input_array) -> total
      true -> check_valid_triangle(index, input_array, total)
    end
  end

  defp check_valid_triangle(index, input_array, total) do
    triangle = [input_array[index], input_array[index + 3], input_array[index + 6]]

    updated_input =
      input_array
      |> Arrays.replace(index, "X")
      |> Arrays.replace(index + 3, "X")
      |> Arrays.replace(index + 6, "X")

    if is_valid_triangle(triangle) do
      check_triangle(index + 1, updated_input, total + 1)
    else
      check_triangle(index + 1, updated_input, total)
    end
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
