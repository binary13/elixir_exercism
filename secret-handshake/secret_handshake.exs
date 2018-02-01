defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    rdigits = Enum.reverse(Integer.digits(code,2))
    list = []
    if Enum.at(rdigits, 0) == 1, do: list = list ++ ["wink"]
    if Enum.at(rdigits, 1) == 1, do: list = list ++ ["double blink"]
    if Enum.at(rdigits, 2) == 1, do: list = list ++ ["close your eyes"]
    if Enum.at(rdigits, 3) == 1, do: list = list ++ ["jump"]
    if Enum.at(rdigits, 4) == 1, do: list = Enum.reverse(list)
    list
  end

end

# SecretHandshake.commands(12) |> IO.inspect