defmodule Examples.GenServer.SimpleServer do 
  use GenServer
  require Logger

  def announce(server \\ __MODULE__) do 
    GenServer.cast(server, :announce)
  end

  def add(a, b, server \\ __MODULE__) do 
    GenServer.call(server, {:add, a, b})
  end
  
  def start_link(init_args, name: name) do 
    GenServer.start_link(__MODULE__, init_args, name: name)
  end

  def init(speaker: speaker) do
    :timer.send_interval(30000, :announce)
    {:ok, %{speaker: speaker, last_result: nil}}
  end

  def handle_cast(:announce, state = %{speaker: speaker, last_result: result})do
    Logger.info("#{speaker}: The last result I computed was #{result}") 
    {:noreply, state}
  end

  def handle_call({:add, a, b}, _from, state) do 
    result = a + b
    {:reply, result, %{state | last_result: result}}
  end

  def handle_info(:announce, state = %{speaker: speaker, last_result: result}) do
    Logger.info("#{speaker}: The last result I computed was #{result}") 
    {:noreply, state}
  end


end
