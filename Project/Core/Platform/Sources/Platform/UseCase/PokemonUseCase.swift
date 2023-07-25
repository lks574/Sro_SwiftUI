import Domain
import Foundation
import Functor

public struct PokemonUseCase {
  let endPointBuilder: EndpointBuilder

  public init(endPointBuilder: EndpointBuilder) {
    self.endPointBuilder = endPointBuilder
  }
}

extension PokemonUseCase: Domain.PokemonUseCase {
  public var pokeList: (PokemonRepository.Request.PokemonList) async -> Result<Domain.PokemonRepository.PokemonList, Domain.ErrorDomain> {
    {
      await endPointBuilder.fetch(method: .get, path: "api/v2/pokemon", body: $0)
    }
  }
}
