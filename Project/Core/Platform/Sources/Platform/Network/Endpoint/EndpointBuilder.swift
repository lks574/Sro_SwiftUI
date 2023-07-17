import Domain
import Functor

public struct EndpointBuilder {
  public init(baseURL: String) {
    self.baseURL = baseURL
  }

  let baseURL: String
}

extension EndpointBuilder {
  func fetch<T: Decodable>(method: HttpMethod, path: String) async -> Result<T, ErrorDomain> {
    await RemoteClient().fetchModel(endpoint: .init(
      path: path,
      baseURL: baseURL,
      queryParams: [:],
      method: method,
      headers: [:],
      bodyItems: [:],
      formData: [:],
      contentForm: .none))
  }

  func fetch(method: HttpMethod, path: String) async -> Result<Void, ErrorDomain> {
    await RemoteClient().fetch(endpoint: .init(
      path: path,
      baseURL: baseURL,
      queryParams: [:],
      method: method,
      headers: [:],
      bodyItems: [:],
      formData: [:],
      contentForm: .none)
    )
  }
}
