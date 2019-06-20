require IEx;

defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @starting ["(", "{", "["]
  @closing [")", "}", "]"]

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
      chars = str
      |> String.graphemes
      |> Enum.filter(fn s -> s in @starting or s in @closing end)

      balanced?([], chars)
  end

  def balanced?([], []), do: true
  def balanced?(_, []), do: false

  def balanced?(stack, [head|tail]) when head in @starting do
    balanced?([head] ++ stack, tail)
  end
  def balanced?(["["|stack], ["]"|tail]) do
    balanced?(stack, tail)
  end
  def balanced?(["{"|stack], ["}"|tail]) do
    balanced?(stack, tail)
  end
  def balanced?(["("|stack], [")"|tail]) do
    balanced?(stack, tail)
  end
  def balanced?(_, [head|_]) when head in @closing, do: false
end
