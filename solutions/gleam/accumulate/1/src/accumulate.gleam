import gleam/list as l

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  l.map(list, fun)
}
