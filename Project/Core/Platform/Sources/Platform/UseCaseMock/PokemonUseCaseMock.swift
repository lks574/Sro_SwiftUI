import Domain
import Foundation
import Functor

public struct PokemonUseCaseMock {

  public init() { }

  public var type: ResponseType = .success
  public var response: Response = .init()
}

extension PokemonUseCaseMock {
  public enum ResponseType {
    case success
    case failure(ErrorDomain)
  }

  public struct Response {
    public init() { }

    public var pokeList: Domain.PokemonRepository.PokemonList = {
      let file = Bundle.module.url(forResource: "pokemon", withExtension: "json", subdirectory: "")
      let data = try! Data(contentsOf: file!)
      return try! JSONDecoder().decode(Domain.PokemonRepository.PokemonList.self, from: data)
    }()
  }
}

extension PokemonUseCaseMock: Domain.PokemonUseCase {
  public var pokeList: () async -> Result<Domain.PokemonRepository.PokemonList, Domain.ErrorDomain> {
    {
      switch self.type {
      case .success: return .success(self.response.pokeList)
      case .failure(let error): return .failure(error)
      }
    }
  }
}
