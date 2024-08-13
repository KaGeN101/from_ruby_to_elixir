defmodule Examples.Modules.Extract do 
  def inline do
    Enum.each(names(), fn name -> 
      capitalized = String.capitalize(name) 
      phrase = "Hello, #{capitalized}" 
      IO.puts(phrase)
    end) 
  end

  def extracted do
    Enum.each(names(), & print_name/1)
  end

  defp print_name(name) do
   capitalized = String.capitalize(name) 
   phrase = "Hello, #{capitalized}" 
   IO.puts(phrase)
  end

  defp names do
    ["joe", "robert", "mike"]
  end end