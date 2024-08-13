defmodule Examples.Spawn.Infinite do 
  
  def start do
    spawn(& loop/0) 
  end
  
  defp loop do
    receive do
      {:add, a, b} -> 
        IO.puts(a + b) 
        loop()
      
      :memory -> 
        {:memory, bytes} = Process.info(self(), :memory) 
        IO.puts("I am using #{bytes} bytes")
        loop()

      :crash -> raise "I crashed"

      :bye -> IO.puts("Goodbye")
    end 
  end

end
