import gleam/int
import gleam/list
import gleam/result

pub fn rows(n: Int) -> List(List(Int)) {
  let result =
    list.range(from: 0, to: n - 1)
    |> list.index_map(fn(x, i) {
      list.range(0, x) |> list.map(fn(y) { binomial(i, y) })
    })

  case n {
    0 -> []
    _ -> result
  }
}

fn binomial(n: Int, k: Int) -> Int {
  int.divide(factorial(n), int.multiply(factorial(k), factorial(n - k)))
  |> result.unwrap(0)
}

fn factorial(n: Int) -> Int {
  let n = case n {
    0 -> 1
    _ -> n
  }

  list.range(1, n) |> int.product
}
