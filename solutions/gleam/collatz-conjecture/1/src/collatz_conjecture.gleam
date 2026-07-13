import gleam/int
import gleam/result

pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number < 0 {
    True -> Error(NonPositiveNumber)
    False -> Ok(conjecture(number, 0))
  }
}

fn conjecture(number: Int, step: Int) -> Int {
  case number {
    1 -> step
    n if n % 2 == 0 ->
      int.divide(n, 2) |> result.unwrap(0) |> conjecture(step + 1)
    n if n % 2 != 0 -> { n * 3 } + 1 |> conjecture(step + 1)
    _ -> 0
  }
}

pub fn main() {
  conjecture(6, 0) |> echo
}
