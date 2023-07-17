import Foundation

public protocol PokemonUseCase {
  var pokeList: () async -> Result<PokemonRepository.PokemonList, ErrorDomain> { get }
}
