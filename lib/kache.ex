defmodule XRepo.Kache do
use GenServer

def start_link do
  GenServer.start_link(__MODULE__, %{})
end

def init(state) do
  start_ets()
  {:ok, state}
end

def handle_info(:start_ets, state) do
  item = start_ets()

  {:noreply, [item | state]}
end

def start_ets() do
  :ets.new(:xtable, [
    :set,
    :public,
    :named_table
  ])
  insert_ets()
end
def insert_ets() do
  :ets.insert(:xtable, {:hello, "world"})
end

end
