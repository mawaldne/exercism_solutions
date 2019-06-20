defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.flat_map(fn factor -> find_factors(limit, factor, factor, []) end)
    |> Enum.uniq
    |> Enum.sum
  end

  defp find_factors(limit,factor,_,list) when factor >= limit do
    list
  end

  defp find_factors(limit, factor, orig_factor, list) when factor < limit do
    find_factors(limit, factor + orig_factor, orig_factor, list ++ [factor])
  end
end
