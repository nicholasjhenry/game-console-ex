defmodule GameConsole.Player do
  alias GameConsole.{PlayerRegistered, PlayerHit}

  @initial_health 100

  defstruct name: :unknown, health: @initial_health

  # public command API

  def register(%{name: :unknown}, name) do
    %PlayerRegistered{name: name, health: @initial_health}
  end
  def register(_player, _name), do: {:error, :player_previously_registered_with_name}

  def hit(%{name: name, health: player_health}, damage, hitter) do
    %PlayerHit{hitter: hitter, name: name, damage_taken: damage, remaining_health: calculate_health(player_health, damage)}
  end

  # state mutators

  def apply(%__MODULE__{} = player, %PlayerRegistered{name: name, health: health}) do
    %{player | name: name, health: health}
  end

  def apply(%__MODULE__{} = player, %PlayerHit{damage_taken: damage_taken}) do
    %{player | health: calculate_health(player.health, damage_taken)}
  end

  defp calculate_health(player_health, damage_taken) do
    player_health - damage_taken
  end
end

