defmodule Examples do
  @moduledoc """
  Documentation for `Examples`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Examples.hello()
      :world

  """
  def hello do
    :world
  end

  def guards(number) do
    #Guards
    case number do
      n when n < 5 -> :low
      n when n >= 5 and n < 10 -> :medium 
      n when is_number(n) -> :high
    end
  end
end

# Case Example
case {:ok, "a string"} do
  :not_a_match -> 
    IO.puts "will not run"
  {:ok, string} -> 
    IO.puts(string) 
    "return value"
end

# With Example
with {:ok, files} <- File.ls("."),
  [first_file | _rest] <- Enum.sort(files),
  {:ok, %{ctime: created}} <- File.lstat(first_file) do IO.puts("The file #{first_file} was created at #{inspect created}")
else
  {:error, _} -> {:error, "file system failed"}
  [] -> {:error, "no files"} 
end

#Cond Examples
cond do
  false -> "no"
  true ->
    IO.puts "Multiple-lines can be used" 
    "yes"
end

falsy = false
cond do
  falsy == false -> "no"
  true ->
    IO.puts "Multiple-lines can be used" 
    "yes"
end

str = "The fox jumped over the dog"
cond do
  String.contains?(str, "z") -> "not this"
  2 * 2 == 100 -> "certainly not this" 
  length(String.split(str, " ")) >= 5 -> "5 words or more"
end


# pid = spawn(fn -> receive do
#   :hello -> IO.puts("Hello World")
#   {:hello, name} -> IO.puts("Hello #{name}") end
# end)
