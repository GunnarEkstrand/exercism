import gleam/list
import gleam/result

pub fn today(days: List(Int)) -> Int {
  list.first(days) |> result.unwrap(0)
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  [today(days) + 1, ..list.drop(days, 1)]
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  days |> list.contains(0)
}

pub fn total(days: List(Int)) -> Int {
  days |> list.fold(0, fn(acc, day) { acc + day })
}

pub fn busy_days(days: List(Int)) -> Int {
  days |> list.count(fn(day) { day >= 5 })
}
