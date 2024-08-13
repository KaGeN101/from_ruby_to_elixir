defmodule Examples.Patterns.Recursion do 
  
  def biggest_number(list) do
    biggest_number(list, nil)
  end
    
  defp biggest_number([], max), do: max
  
  defp biggest_number([head | tail], current_max) do 
    next_max = max(head, current_max || head) 
    biggest_number(tail, next_max)
  end
   
end