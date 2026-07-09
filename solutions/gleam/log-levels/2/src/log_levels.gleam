import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> rest -> rest
    "[WARNING]:" <> rest -> rest
    "[ERROR]:" <> rest -> rest
    _ -> "[UNKNOWN ERROR]"
  }
  |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[WARNING]:" <> _ -> "warning"
    "[ERROR]:" <> _ -> "error"
    _ -> "info"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
