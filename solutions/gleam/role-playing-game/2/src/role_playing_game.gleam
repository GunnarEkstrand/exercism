import gleam/int
import gleam/io
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player {
    Player(Some(name), ..) -> name
    _ -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(name, level, health, _mana) if health == 0 && level >= 10 ->
      Some(Player(name, level, 100, Some(100)))
    Player(name, level, health, mana) if health == 0 ->
      Some(Player(name, level, 100, mana))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) if mana >= cost -> #(
      Player(..player, mana: Some(mana - cost)),
      cost * 2,
    )
    Some(mana) -> #(player, 0)
    None -> #(
      Player(
        ..player,
        health: int.clamp(player.health - cost, min: 0, max: cost),
      ),
      0,
    )
  }
}
