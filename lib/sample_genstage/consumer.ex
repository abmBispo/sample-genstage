defmodule SampleGenstage.Consumer do
  use GenStage

  def start_link(_initial) do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [{SampleGenstage.ProducerConsumer, max_demand: 5}]}
  end

  def handle_events(messages, _from, state) do
    Process.sleep(500)
    for event <- messages do
      IO.inspect({self(), event, state})
    end

    # As a consumer we never emit messages
    {:noreply, [], state}
  end
end
