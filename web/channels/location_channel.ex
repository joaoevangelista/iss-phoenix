defmodule ISS.LocationChannel do
  use Phoenix.Channel

  def join("locations:now", _msg, socket) do
    {:ok, socket}
  end

end
