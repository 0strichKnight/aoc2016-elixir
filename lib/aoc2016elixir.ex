defmodule Aoc2016elixir do
  @moduledoc """
  Documentation for `Aoc2016elixir`.
  """
  defmodule Input do
    @moduledoc """
    Common file related operations for Advent of Code 2016
    """
    @doc """
    Parse input from file.

    Opens `input_file` from `priv` folder and returns the content as an list of tokens.
    """
    def parse_input_from_file(input_file) do
      Path.join(:code.priv_dir(:aoc2016elixir), input_file)
      |> File.stream!()
      |> Enum.map(&String.split(&1, ",", trim: true))
    end

    @doc """
    Parses input from file as a list of lists.

    Opens `input_file` from `priv` folder, reads each line, splits it by character,
    and returns a list of list of characters.
    """
    def parse_input_as_lines(input_file) do
      Path.join(:code.priv_dir(:aoc2016elixir), input_file)
      |> File.stream!()
      |> Enum.map(&String.split(&1, "", trim: true))
    end
  end
end
