extension PokemonRepository {
  public struct Request: Equatable { }
}

extension PokemonRepository.Request {
  public struct PokemonList: RequestParameterType, Equatable {
    public let offset: Int
    public let limit: Int

    public init(offset: Int, limit: Int = 40) {
      self.offset = offset
      self.limit = limit
    }

    public func mapToParameters() -> [String : Any] {
      [
        "offset": "\(offset)",
        "limit": "\(limit)",
      ]
    }
  }
}
