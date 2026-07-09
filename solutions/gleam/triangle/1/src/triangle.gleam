import gleam/float
import gleam/list

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a == b } && { b == c } && { a == c }
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  let sides = [a, b, c]

  case sides {
    [x, y, _] if x == y -> is_triangle(a, b, c)
    [x, _, z] if x == z -> is_triangle(a, b, c)
    [_, y, z] if y == z -> is_triangle(a, b, c)
    [x, y, z] if { x == y } && { y == z } -> is_triangle(a, b, c)
    _ -> False
  }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a != b } && { b != c } && { a != c }
}

pub fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  { a *. b *. c >. 0.0 } && { a +. b >=. c && b +. c >=. a && a +. c >=. b }
}

pub fn main() {
  echo isosceles(0.1, 0.1, 0.3)
}
