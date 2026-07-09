import gleam/string

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  let question = string.ends_with(remark, "?")
  let yell = remark == string.uppercase(remark)

  case remark {
    _ if question && yell -> "Calm down, I know what I'm doing!"
    _ if question -> "Sure."
    _ if yell -> "Whoa, chill out!"
    r if r == "" -> "Fine. Be that way!"
    _ -> "Whatever."
  }
}
