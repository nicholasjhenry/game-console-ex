defmodule GameConsole.Router do
  use Commanded.Commands.Router
  middleware Commanded.Middleware.Logger

  alias GameConsole.{
    Player,
    CreatePlayer,
    CreatePlayerHandler,
    HitPlayer,
    HitPlayerHandler
  }

  dispatch CreatePlayer, to: CreatePlayerHandler, aggregate: Player, identity: :name
  dispatch HitPlayer, to: HitPlayerHandler, aggregate: Player, identity: :name
end