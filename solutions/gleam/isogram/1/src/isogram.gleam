import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let cleaned_phrase =
    phrase
    |> string.replace(" ", "")
    |> string.replace("-", "")
    |> string.lowercase

  let graphemes = string.to_graphemes(cleaned_phrase)

  graphemes |> list.unique |> list.length == graphemes |> list.length
}
