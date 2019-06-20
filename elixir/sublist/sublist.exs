defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b -> :equal
      Enum.empty?(a) -> :sublist
      Enum.empty?(b) -> :superlist
      length(a) < length(b) and sublist?(a,b) -> :sublist
      length(a) > length(b) and sublist?(b,a) -> :superlist
      true -> :unequal
    end
  end

  def sublist?(_, []) do
    false
  end

  def sublist?(a, b) do
    if hd(a) === hd(b) and Enum.take(b, length(a)) == a do
      true
    else
      sublist?(a, tl(b))
    end
  end
end
