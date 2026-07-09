import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = number |> int.digits(10)

  digits
  |> list.map(fn(x) {list.repeat(x, list.length(digits)) |> list.fold(1, int.multiply)})
  |> int.sum
  == number
}
