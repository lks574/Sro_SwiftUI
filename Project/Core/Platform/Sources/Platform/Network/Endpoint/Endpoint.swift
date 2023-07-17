import Combine
import Domain
import Foundation
import Functor

public struct Endpoint {

  // MARK: Lifecycle

  public init(
    path: String,
    baseURL: String,
    queryParams: [String: String],
    method: HttpMethod,
    headers: [String: String],
    bodyItems: [String: Any],
    formData: [String: Any]?,
    contentForm: ContentForm?)
  {
    self.path = path
    self.baseURL = baseURL
    self.queryParams = queryParams
    self.method = method
    self.headers = headers
    self.bodyItems = bodyItems
    self.formData = formData
    self.contentForm = contentForm
  }

  // MARK: Internal

  let path: String
  let baseURL: String
  let queryParams: [String: String]
  let method: HttpMethod
  let headers: [String: String]
  let bodyItems: [String: Any]
  let formData: [String: Any]?
  let contentForm: ContentForm?

  var url: String {
    guard var component = URLComponents(string: [baseURL, path].joined(separator: "/"))
    else { return "" }

    let items = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
    let bodyItems = method == .get ? bodyItems.map { URLQueryItem(name: $0.key, value: "\($0.value)") } : []
    component.queryItems = Array(Set((component.queryItems ?? []) + items + bodyItems))

    return component.url?.absoluteString ?? ""
  }
}

public struct ContentForm {
  public let fileName: String
  public let data: Data
  public let mimeType: String
}
