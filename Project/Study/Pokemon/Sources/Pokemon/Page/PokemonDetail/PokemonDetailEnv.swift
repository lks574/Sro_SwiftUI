import Domain
import ComposableArchitecture
import Foundation

public struct PokemonDetailEnv {
  public init(
    appEnvironment: AppEnvironment)
  {
    self.appEnvironment = appEnvironment
  }

  public let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  public let appEnvironment: AppEnvironment
}

extension PokemonDetailEnv {

}
