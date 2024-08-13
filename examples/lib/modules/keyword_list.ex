defmodule Examples.Modules.KeywordList do

  def maybe_print(arg, opts) do
    print? = Keyword.get(opts, :print?, true)
    if print? do 
      IO.puts("printing #{arg}")
    end
    
    arg
  end 
end