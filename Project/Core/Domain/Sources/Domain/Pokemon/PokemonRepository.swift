import Foundation

public enum PokemonRepository { }

extension PokemonRepository {
  public struct PokemonList: Equatable, Decodable {
    public let count: Int
    public let next: String
    public let previous: String?
    public let pokemons: [Pokemon]

    public init(count: Int, next: String, previous: String?, pokemons: [Pokemon]) {
      self.count = count
      self.next = next
      self.previous = previous
      self.pokemons = pokemons
    }

    enum CodingKeys: String, CodingKey {
      case count, next
      case previous
      case pokemons = "results"
    }
  }

  // MARK: - Result
  public struct Pokemon: Equatable, Decodable {
    public let name: String
    public let url: String

    public init(name: String, url: String) {
      self.name = name
      self.url = url
    }
  }
}
