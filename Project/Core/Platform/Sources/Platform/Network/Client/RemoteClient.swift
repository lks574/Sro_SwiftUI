import Alamofire
import Foundation
import Domain

struct RemoteClient { }

extension RemoteClient {
  func fetch(endpoint: Endpoint) async -> Result<Void, ErrorDomain> {
    await endpoint.fetch()
      .map { _ in Void() }
  }

  func fetchModel<T: Decodable>(endpoint: Endpoint) async -> Result<T, ErrorDomain> {
    switch await endpoint.fetch() {
    case .success(let data):
      do {
        let model = try JSONDecoder().decode(T.self, from: data)
        return .success(model)
      } catch {
        return .failure(.other(error))
      }
    case .failure(let error):
      return .failure(error)
    }
  }

  func fetchToData(endpoint: Endpoint) async -> Result<Data, ErrorDomain> {
    await endpoint.fetch()
  }
}

extension Endpoint {
  fileprivate func fetch() async -> Result<Data, ErrorDomain> {
    guard NetworkReachabilityManager()?.isReachable ?? false else {
      return .failure(.networkOffline)
    }

    var sessionManager: Session {
      Session.default
    }

    guard let urlRequest = buildRequest() else {
      return .failure(.invalidTypeCasting)
    }

    let result = await sessionManager.request(urlRequest)
      .validate()
      .serializingData()
      .response

    do {
      return .success(try result.serialized(rawValue: urlRequest))
    } catch (let error) {
      return .failure(.other(error))
    }
  }
}

extension DataResponse<Data, AFError> {
  func serialized(rawValue _: URLRequest? = .none) throws -> Data {
    guard let error else { return data ?? .init() }

    if case AFError.explicitlyCancelled = error {
      throw ErrorDomain.userCancelled
    }

    if case AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength) = error {
      return data ?? .init()
    }

    throw ErrorDomain.other(error)
  }
}
