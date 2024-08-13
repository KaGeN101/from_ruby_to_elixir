defmodule Examples.Patterns.BooleanCase do 

  def to_bool(value) do
    case value do
      bool when is_boolean(bool) -> bool
      0 -> false
      nil -> false
      str when str in ["undefined", "false", "0"] -> false 
      _ -> true
    end 
  end

end