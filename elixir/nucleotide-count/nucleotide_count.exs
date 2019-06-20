defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless valid_nucleotide?(nucleotide), do: raise ArgumentError
    unless valid_strand?(strand), do: raise ArgumentError

    strand |> Enum.count(fn(x) -> x == nucleotide end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    unless valid_strand?(strand), do: raise ArgumentError

    strand |> Enum.reduce(nucleotides_map, fn nucleotide, acc ->
      Map.put(acc, nucleotide, Map.get(acc, nucleotide, 0) + 1)
    end)
  end

  def valid_strand?(strand) do
    strand |> Enum.all?(fn(nucleotide) -> valid_nucleotide?(nucleotide) end)
  end

  def valid_nucleotide?(nucleotide) do
    nucleotide in @nucleotides
  end

  def nucleotides_map do
    Enum.map(@nucleotides, fn(x) -> {x, 0} end)
     |> Enum.into(%{})
  end
end
