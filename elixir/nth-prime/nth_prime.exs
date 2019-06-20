defmodule Prime do

  @doc """
  Generates the nth prime.
  """

  def nth(count) when count <= 0, do: raise Error

  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0 do
    Stream.iterate(1, &(&1 + 1))
    |> Stream.filter(fn(x) -> prime?(x) == true end)
    |> Enum.take(count)
    |> List.last
  end


  def prime?(n) when n < 2, do: false
  def prime?(n) when n == 2 or n == 3, do: true
  def prime?(n) when n > 2 and rem(n, 2) == 0, do: false
  def prime?(n) do
    # http://stackoverflow.com/questions/5811151/why-do-we-check-upto-the-square-root-of-a-prime-number-to-determine-if-it-is-pri
    max = round(:math.sqrt(n)) + 1

    # Check only odd numbers. We covered evens above
    3..max
    |> Enum.take_every(2)
    |> Enum.all?(fn x -> rem(n,x) != 0 end)
  end
end
