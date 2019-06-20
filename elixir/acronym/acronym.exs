defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/(?:\b[a-z]|[A-Z])/, string)
    |> List.flatten
    |> Enum.reduce("", fn letter, acc ->
      acc <> String.upcase(letter)
    end)
  end
end
