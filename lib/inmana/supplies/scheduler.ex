defmodule Inmana.Supplies.Scheduler do
  use GenServer
  alias Inmana.Supplies.ExpirationNotification

  # Cliente --------------------------------------
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Servidor --------------------------------------
  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  def schedule_notification do
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
