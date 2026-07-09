import gleam/int

pub fn convert(number: Int) -> String {
  let result = pling(number) <> plang(number) <> plong(number)
  case result {
    r if r == "" -> int.to_string(number)
    _ -> result
  }
}

fn pling(number: Int) -> String {
  case number {
    n if n % 3 == 0 -> "Pling"
    _ -> ""
  }
}

fn plang(number: Int) -> String {
  case number {
    n if n % 5 == 0 -> "Plang"
    _ -> ""
  }
}

fn plong(number: Int) -> String {
  case number {
    n if n % 7 == 0 -> "Plong"
    _ -> ""
  }
}
