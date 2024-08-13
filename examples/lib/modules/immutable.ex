defmodule Examples.Modules.Immutable do 

  def map_change(map) do
    Map.merge(map, %{a: 1, b: 2}) 
  end

end