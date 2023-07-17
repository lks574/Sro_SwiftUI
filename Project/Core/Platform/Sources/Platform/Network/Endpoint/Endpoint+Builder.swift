import Foundation

extension Endpoint {

  func buildRequest(timeoutInterval: TimeInterval = 60.0) -> URLRequest? {
    URLRequest.serialized(rawValue: self, timeoutInterval: timeoutInterval)
  }
}

extension URLRequest {
  static func serialized(rawValue: Endpoint, timeoutInterval: TimeInterval) -> Self? {
    guard let url = URL(string: rawValue.url)
    else { return .none }

    var request = URLRequest(
      url: url,
      timeoutInterval: timeoutInterval)

    request.httpMethod = rawValue.method.rawValue.uppercased()

    let defaultHeader = [
      "Accept": "*/*",
      "Content-Type": "application/json",
    ]
    defaultHeader
      .merging(rawValue.headers) { $1 }
      .forEach {
        request.setValue($0.value, forHTTPHeaderField: $0.key)
      }

    if rawValue.method != .get, !rawValue.bodyItems.isEmpty {
      do {
        request.httpBody = try JSONSerialization.data(
          withJSONObject: rawValue.bodyItems,
          options: .prettyPrinted)
      } catch {
        print(error)
        return .none
      }
    }

    return request
  }
}
