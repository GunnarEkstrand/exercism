import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> rest -> string.trim(rest)
    "[WARNING]:" <> rest -> string.trim(rest)
    "[ERROR]:" <> rest -> string.trim(rest)
    _ -> "[UNKNOWN ERROR]"
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> _rest -> "info"
    "[WARNING]:" <> _rest -> "warning"
    "[ERROR]:" <> _rest -> "error"
    _ -> "[UNKNOWN ERROR]"
  }
}

pub fn reformat(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> _rest | "[WARNING]:" <> _rest | "[ERROR]:" <> _rest ->
      message(log_line) <> " (" <> log_level(log_line) <> ")"
    _ -> "[UNKNOWN ERROR]"
  }
}
