import gleam/int
import gleam/list
import gleam/result

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits = number |> int.digits(10) |> result.unwrap([])

  digits
  |> list.map(fn(x) {
    list.range(1, list.length(digits))
    |> list.map(fn(_) { x })
    |> list.reduce(fn(acc, y) { acc * y })
  })
  |> list.map(fn(x) { result.unwrap(x, 0) })
  |> list.reduce(fn(acc, x) { acc + x })
  |> result.unwrap(0)
  == number
}
