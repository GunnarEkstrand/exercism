import gleam/io
import gleam/list
import gleam/result
import gleam/string

pub fn first_letter(name: String) -> String {
  name
  |> string.trim
  |> string.first
  |> result.unwrap("")
}

pub fn initial(name: String) -> String {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) -> String {
  full_name
  |> string.split(on: " ")
  |> list.map(initial)
  |> list.reduce(fn(acc, s) { string.append(acc <> " ", s) })
  |> result.unwrap("")
}

pub fn pair(full_name1: String, full_name2: String) -> String {
  "       ******       ******
     **      **   **      **
   **         ** **         **
  **            *            **
  **                         **
**     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> "     **   **                       **
     **                   **
       **               **
         **           **
           **       **
             **   **
               ***
                *"
}
