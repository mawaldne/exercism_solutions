defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    downcase_base = String.downcase(base)
    sorted_base = sort_string(base)

    candidates
    |> Enum.filter(fn candidate -> downcase_base != String.downcase(candidate) end)
    |> Enum.filter(fn candidate -> sorted_base == sort_string(candidate) end)
  end

  def sort_string(string) do
    string
    |> String.downcase
    |> String.graphemes
    |> Enum.sort
  end
end
