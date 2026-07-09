import gleam/int
import gleam/list
import gleam/result

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits = number |> int.digits(10) |> result.unwrap([])
  digits
  |> list.map(fn(x) {
    list.repeat(x, list.length(digits))
    |> list.reduce(int.multiply)
  })
  |> list.map(fn(x) { result.unwrap(x, 0) })
  |> int.sum
  == number
}
