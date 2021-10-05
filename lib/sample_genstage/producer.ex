defmodule SampleGenstage.Producer do
  @moduledoc false

  use GenStage

  def start_link(initial) do
    GenStage.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def init(state) do
    {:producer, state}
  end

  def handle_demand(_demand, message) do
    IO.inspect(message, label: "producer")
    {:noreply, [message], message}
  end

  # You can test the back-pressure working stressing
  # the genstage. Try:
  # for _ <- 1..1000, do: Genstage.cast(SampleGenstage.Producer, {:send_message, "any message you want"})
  def handle_cast({:send_message, message}, state) do
    {:noreply, [message], state}
  end
end
