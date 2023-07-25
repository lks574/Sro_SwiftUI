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
  public var getPokemonList: (PokemonRepository.Request.PokemonList) -> EffectTask<Result<PokemonRepository.PokemonList, ErrorDomain>> {
    { req in
      .task { await appEnvironment.pokemonUseCase.pokeList(req) }
    }
  }
}
