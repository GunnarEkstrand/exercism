import gleam/float
import gleam/int
import gleam/list
import gleam/result

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits = number |> int.digits(10) |> result.unwrap([])
  let number_of_digits = list.length(digits)

  digits
  |> list.map(fn(x) { int.power(x, of: int.to_float(number_of_digits)) })
  |> list.map(fn(x) { result.unwrap(x, 0.0) })
  |> list.reduce(fn(acc, x) { acc +. x })
  |> result.unwrap(0.0)
  |> float.truncate
  == number
}
