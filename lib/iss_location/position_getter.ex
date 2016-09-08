defmodule ISS.PositionGetter do
  require Logger

  def get do
    HTTPoison.get("http://api.open-notify.org/iss-now.json")
  end

  def broadcast({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    latlng = decode_latlng(body)
    ISS.Endpoint.broadcast("locations:now", "new_message", latlng)
  end

  def broadcast({:error, %HTTPoison.Error{reason: reason}}) do
    Logger.error(reason)
  end

  defp decode_latlng(raw_body) do
    data = Poison.decode!(raw_body)
    data["iss_position"]
  end
end
