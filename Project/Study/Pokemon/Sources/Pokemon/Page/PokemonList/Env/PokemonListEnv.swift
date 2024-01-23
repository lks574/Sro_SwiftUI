import Domain
import ComposableArchitecture
import Foundation

public struct PokemonListEnv {
  public init(
    appEnvironment: AppEnvironment)
  {
    self.appEnvironment = appEnvironment
  }

  public let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  public let appEnvironment: AppEnvironment
}

extension PokemonListEnv {

  public var getPokemonList: (PokemonRepository.Request.PokemonList) -> Effect<Result<PokemonRepository.PokemonList, ErrorDomain>> {
    { req in
      .run { sender in
        let result = await appEnvironment.pokemonUseCase.pokeList(req)
        return await sender(result)
      }
    }
  }
}
