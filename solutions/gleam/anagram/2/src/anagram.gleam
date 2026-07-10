import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  candidates
  |> list.filter(fn(c) { convert_letters(c) == convert_letters(word) })
  |> list.filter(fn(c) { !is_same_word(c, word) })
}

fn is_same_word(candidate: String, word: String) -> Bool {
  candidate |> string.lowercase == word |> string.lowercase
}

fn convert_letters(word: String) -> List(String) {
  word
  |> string.to_graphemes
  |> list.map(string.lowercase)
  |> list.sort(string.compare)
}
