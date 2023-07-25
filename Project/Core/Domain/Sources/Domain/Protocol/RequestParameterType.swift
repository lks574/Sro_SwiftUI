public protocol RequestParameterType {
  func mapToParameters() -> [String: Any]
}
