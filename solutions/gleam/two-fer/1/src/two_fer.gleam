import gleam/option.{type Option, None, Some}

pub fn two_fer(name: Option(String)) -> String {
  let result = case name {
    Some(name) -> name
    None -> "you"
  }

  "One for " <> result <> ", one for me."
}
