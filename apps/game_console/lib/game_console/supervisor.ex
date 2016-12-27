defmodule GameConsole.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(Commanded.Event.Handler, ["player_count_handler", GameConsole.PlayerCountHandler, [start_from: :current]])
    ]

    supervise(children, strategy: :one_for_one)
  end
end