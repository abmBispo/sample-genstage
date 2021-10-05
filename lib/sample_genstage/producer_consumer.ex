defmodule SampleGenstage.ProducerConsumer do
  use GenStage

  require Integer

  def start_link(_initial) do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [SampleGenstage.Producer]}
  end

  def handle_events(messages, _from, state) do
    IO.inspect(messages, label: "producer-consumer")
    {:noreply, messages, state}
  end
end
