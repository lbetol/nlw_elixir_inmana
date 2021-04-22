defmodule Inmana.Supplies.Scheduler do
  use GenServer

  def init(state \\ %{}) do
    {:ok, state}
  end

  # essa função é assíncrona
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  # essa função é sincrona
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end
end
