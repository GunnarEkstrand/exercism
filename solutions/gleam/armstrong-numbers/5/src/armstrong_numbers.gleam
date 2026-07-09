import gleam/int
import gleam/list
import gleam/result

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits = number |> int.digits(10) |> result.unwrap([])

  digits
  |> list.map(fn(x) {
    list.repeat(x, list.length(digits)) |> list.fold(1, with: int.multiply)
  })
  |> int.sum
  == number
}
