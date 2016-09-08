defmodule ISS.PositionScheduler do
  use GenServer

  def start_link do
    GenServer.start_link __MODULE__, %{}
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    ISS.PositionGetter.get
    |> ISS.PositionGetter.broadcast()
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work do
    Process.send_after(self(), :work, 15 * 1000) # Send after 15 seconds
  end
end
