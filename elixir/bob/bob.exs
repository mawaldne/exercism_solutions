defmodule Bob do
  def hey(input) do
    input
    |> String.trim
    |> respond
   end

  defp respond(input) do
    cond do
        String.length(input) == 0 -> "Fine. Be that way!"
        String.ends_with?(input, "?") -> "Sure."
        String.match?(input, ~r/[[:alpha:]]/) and input == String.upcase(input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end
