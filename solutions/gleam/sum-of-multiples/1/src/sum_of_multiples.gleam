import gleam/int
import gleam/list
import gleam/result

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.map(fn(x) {
    list.range(1, int.divide(limit, x) |> result.unwrap(0))
    |> list.map(fn(y) { y * x })
    |> list.filter(fn(y) { y < limit })
  })
  |> list.flatten
  |> list.unique
  |> int.sum
}
