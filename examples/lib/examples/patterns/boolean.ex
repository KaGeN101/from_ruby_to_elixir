defmodule Examples.Patterns.Boolean do
  @false_s ["", "undefined", "false", "nil", "null", "-0", "0", "no", "off"]
  def to_bool(bool) when is_boolean(bool), do: bool
  def to_bool(0), do: false
  def to_bool(nil), do: false
  def to_bool(str) when is_bitstring(str) and str in @false_s, do: false
  def to_bool(str) when is_bitstring(str) do 
    String.downcase(str) not in @false_s
  end
  def to_bool(_), do: true 
end