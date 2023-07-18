import Domain
import ComposableArchitecture
import Foundation

public struct PokemonListEnv {
  public init(
    pokemonUseCase: PokemonUseCase)
  {
    self.pokemonUseCase = pokemonUseCase
  }

  public let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  public let pokemonUseCase: PokemonUseCase
}

extension PokemonListEnv {
  public var getPokemonList: () -> EffectTask<Result<PokemonRepository.PokemonList, ErrorDomain>> {
    {
      .task { await pokemonUseCase.pokeList() }
    }
  }
}
