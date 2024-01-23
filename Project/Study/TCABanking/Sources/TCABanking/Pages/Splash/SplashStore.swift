import Foundation
import ComposableArchitecture

@Reducer
public struct SplashStore {
  public init() { }

  public struct State: Equatable {
    public init() { }
  }

  public enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
  }

  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
      }
    }
  }
}
