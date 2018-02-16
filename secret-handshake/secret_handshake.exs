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
    c_helper(get_binary(code), [])
  end

  def get_binary(code) do
    Integer.digits(code,2)
  end

  def c_helper([], c_list) do
    if List.last(c_list) == "reverse" do
      Enum.reverse(c_list--["reverse"])
    else
      c_list
    end
  end

  def c_helper([_head|tail], c_list) when length(tail) > 4, do: c_helper(tail,c_list)

  def c_helper([head|tail], c_list) do
    command = ["reverse", "jump", "close your eyes", "double blink", "wink"] 
    
    if head == 1 do
      c_helper(tail, [Enum.at(command, 4-length(tail)) | c_list])
    else
      c_helper(tail, c_list)
    end
  end
end

# SecretHandshake.commands(12) |> IO.inspect