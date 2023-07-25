import Domain
import Functor

public struct EndpointBuilder {
  public init(baseURL: String) {
    self.baseURL = baseURL
  }

  let baseURL: String
}

extension EndpointBuilder {
  func fetch<T: Decodable>(method: HttpMethod, path: String, body: RequestParameterType) async -> Result<T, ErrorDomain> {
    await RemoteClient().fetchModel(endpoint: .init(
      path: path,
      baseURL: baseURL,
      queryParams: [:],
      method: method,
      headers: [:],
      bodyItems: body.mapToParameters(),
      formData: [:],
      contentForm: .none))
  }

  func fetch(method: HttpMethod, path: String, body: [String: Any]) async -> Result<Void, ErrorDomain> {
    await RemoteClient().fetch(endpoint: .init(
      path: path,
      baseURL: baseURL,
      queryParams: [:],
      method: method,
      headers: [:],
      bodyItems: body,
      formData: [:],
      contentForm: .none)
    )
  }
}
