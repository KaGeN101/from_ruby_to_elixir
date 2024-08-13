defmodule Examples.Modules.Two do 
  def hello do
    "Hello"
  end
  # This is a reference to Erlang: The Movie
  def hello("Mike") do 
    "Hello Mike, Hello Joe"
  end
  def hello(name) do 
    "Hello #{name}"
  end

  def hi(name \\ "Reader") do 
    "Hi #{name}"
  end 
end