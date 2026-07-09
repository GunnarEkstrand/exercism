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
  let mana_value = option.unwrap(player.mana, 0)

  case player {
    Player(name, level, health, Some(_)) if mana_value >= cost -> #(
      Player(name, level, health, Some(mana_value - cost)),
      cost * 2,
    )
    Player(name, level, health, None) -> #(
      Player(name, level, int.clamp(health - cost, min: 0, max: cost), None),
      0,
    )
    _ -> #(player, 0)
  }
}

pub fn main() {
  let #(a, _b) = cast_spell(Player(Some("xd"), 67, 5, None), 666)
  io.print(int.to_string(a.health))
}
