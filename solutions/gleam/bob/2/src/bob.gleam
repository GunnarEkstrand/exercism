import gleam/order
import gleam/string

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  let question = string.ends_with(remark, "?")
  let silence = string.is_empty(remark)

  let characters_are_different =
    string.lowercase(remark) != string.uppercase(remark)

  let yell =
    string.uppercase(remark) == remark && characters_are_different && !silence

  case remark {
    _ if question && yell -> "Calm down, I know what I'm doing!"
    _ if question -> "Sure."
    _ if yell -> "Whoa, chill out!"
    _ if silence -> "Fine. Be that way!"
    _ -> "Whatever."
  }
}
