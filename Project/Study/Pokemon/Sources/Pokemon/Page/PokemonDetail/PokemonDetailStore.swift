import Foundation
import ComposableArchitecture
import Domain

@Reducer
public struct PokemonDetailStore {

  @Dependency(\.appEnvironment) var appEnvironment

  public init() { }

  private var env: PokemonDetailEnv {
    .init(appEnvironment: appEnvironment)
  }

  public struct State: Equatable {
    public init() {}

  }

  public enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case onRouteBack
    case onRouteLeft
    case onRouteRight
    case getPoke
  }

  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .onRouteBack:
        return .none

      case .onRouteLeft:
        return .none

      case .onRouteRight:
        return .none

      case .getPoke:
        return .none
      }
    }
  }
}
