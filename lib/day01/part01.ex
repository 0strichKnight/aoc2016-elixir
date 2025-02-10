defmodule Aoc2016elixir.Day01.Part01 do
  alias Aoc2016elixir.Day01
  alias Aoc2016elixir.Input

  def doit() do
    Input.parse_input_from_file(Day01.input_file())
    |> doit()
  end

  def doit(steps) do
    calculate_distance(steps, :north, 0, 0)
  end

  defp calculate_distance([head | tail], orientation, x, y) do
    {direction, blocks} = String.split_at(head, 1)

    {orientation, x, y} =
      Day01.move(orientation, direction, x, y, String.to_integer(blocks))

    calculate_distance(tail, orientation, x, y)
  end

  defp calculate_distance([], _orientation, x, y), do: abs(x) + abs(y)
end
