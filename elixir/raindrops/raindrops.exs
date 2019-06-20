defmodule Raindrops do
  @raindrops_keys [3, 5, 7]
  @raindrops %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    @raindrops_keys
    |> Enum.filter(fn divisor -> rem(number, divisor) == 0 end)
    |> Enum.map(fn raindrop -> @raindrops[raindrop] end)
    |> Enum.join
    |> format(number)
  end

  def format(respond, number) do
    case respond do
      "" -> Integer.to_string(number)
      _ -> respond
    end
  end
end
