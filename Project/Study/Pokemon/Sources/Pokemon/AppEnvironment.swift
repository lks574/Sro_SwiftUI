import Platform
import SwiftUI
import ComposableArchitecture
import Domain

public struct AppEnvironment {
  public let pokemonUseCase: Domain.PokemonUseCase
}

extension AppEnvironment: TestDependencyKey {
  static public var liveValue: AppEnvironment = .init(
    pokemonUseCase: Platform.PokemonUseCase(
      endPointBuilder: EndpointBuilder(
        baseURL: "https://pokeapi.co/")
    )
  )

  public static var testValue: AppEnvironment = .init(
    pokemonUseCase: PokemonUseCaseMock())
}

extension AppEnvironment: DependencyKey {
  static public var previewValue: AppEnvironment = .init(
    pokemonUseCase: PokemonUseCaseMock()
  )
}

extension DependencyValues {
  public var appEnvironment: AppEnvironment {
    get { self[AppEnvironment.self] }
    set { self[AppEnvironment.self] = newValue }
  }
}
