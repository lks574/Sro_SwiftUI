import Foundation

public protocol PokemonUseCase {
  var pokeList: (PokemonRepository.Request.PokemonList) async -> Result<PokemonRepository.PokemonList, ErrorDomain> { get }
}
