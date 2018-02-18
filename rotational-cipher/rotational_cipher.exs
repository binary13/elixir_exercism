defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    Enum.map(to_charlist(text), fn (char) -> rot(char, shift) end)
    |> to_string
  end

  def rot(char, shift) when (char>=65 and char<=90) or (char>=97 and char<=122) do
    rotated = char + shift
    
    cond do
      (char>=65 and char<=90) and rotated > 90 -> <<rotated-26>>
      (char>=97 and char<=122) and rotated > 122 -> <<rotated-26>>
      true -> <<rotated>>
    end
  end

  def rot(char, _shift) do
    char
  end
end

