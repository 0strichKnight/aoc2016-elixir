defmodule Aoc2016elixir.Day01.Part02 do
  alias Aoc2016elixir.Day01
  alias Aoc2016elixir.Input

  def doit() do
    Input.parse_input_from_file(Day01.input_file())
    |> doit()
  end

  def doit(steps) do
    visited = MapSet.put(MapSet.new(), {0, 0})
    find_first_double_visited(steps, :north, 0, 0, visited)
  end

  defp find_first_double_visited([head | tail], orientation, x, y, visited) do
    {direction, blocks} = String.split_at(head, 1)

    {orientation, new_x, new_y} =
      Day01.move(orientation, direction, x, y, String.to_integer(blocks))

    {visited, double} = visit(x, y, new_x, new_y, visited)

    if double == nil do
      find_first_double_visited(tail, orientation, new_x, new_y, visited)
    else
      {{dx, dy}, _found} = double
      find_first_double_visited([], orientation, dx, dy, visited)
    end
  end

  defp find_first_double_visited([], _orientation, x, y, _visited), do: abs(x) + abs(y)

  defp visit(from_x, from_y, to_x, to_y, visited) when from_y == to_y do
    steps =
      Range.new(from_x, to_x)
      |> Enum.slice(1, 1000)
      |> Enum.map(&{&1, from_y})

    visit(steps, visited)
  end

  defp visit(from_x, from_y, to_x, to_y, visited) when from_x == to_x do
    steps =
      Range.new(from_y, to_y)
      |> Enum.slice(1, 1000)
      |> Enum.map(&{from_x, &1})

    visit(steps, visited)
  end

  defp visit(steps, visited) do
    new_steps =
      steps
      |> Enum.map(fn step ->
        {step, MapSet.member?(visited, step)}
      end)
      |> Enum.find(fn {_s, found} -> found end)

    visited = MapSet.union(visited, MapSet.new(steps))

    if new_steps == nil do
      {visited, nil}
    else
      {visited, new_steps}
    end
  end
end
