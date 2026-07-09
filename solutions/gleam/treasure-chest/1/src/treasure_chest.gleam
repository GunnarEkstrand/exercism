pub type TreasureChest(treasure) {
  TreasureChest(String, treasure)
}

pub type UnlockResult(treasure) {
  Unlocked(treasure)
  WrongPassword
}

pub type Pair(a, b) {
  Pair(a, b)
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(lock_pass, treasure) if lock_pass == password ->
      Unlocked(treasure)
    _ -> WrongPassword
  }
}
