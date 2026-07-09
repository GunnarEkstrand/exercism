import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let letters =
    phrase
    |> string.replace(" ", "")
    |> string.replace("-", "")
    |> string.lowercase
    |> string.to_graphemes

  letters |> list.unique == letters
}
