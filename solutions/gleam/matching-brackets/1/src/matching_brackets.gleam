import gleam/list
import gleam/string

pub fn is_paired(value: String) -> Bool {
  brackets(value, "[") == brackets(value, "]")
  && brackets(value, "{") == brackets(value, "}")
  && brackets(value, "(") == brackets(value, ")")
}

fn brackets(value: String, bracket: String) -> Int {
  value
  |> string.to_graphemes
  |> list.count(fn(x) { x == bracket })
}
