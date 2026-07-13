import gleam/int
import gleam/result

pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number < 1 {
    True -> Error(NonPositiveNumber)
    False -> Ok(conjecture(number, 0))
  }
}

fn conjecture(number: Int, steps: Int) -> Int {
  case number, number % 2 == 0 {
    1, _ -> steps
    _, True -> number / 2 |> conjecture(steps + 1)
    _, False -> number * 3 + 1 |> conjecture(steps + 1)
  }
}
