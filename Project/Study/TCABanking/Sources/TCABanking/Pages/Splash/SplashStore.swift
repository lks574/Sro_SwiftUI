import Foundation
import ComposableArchitecture

@Reducer
public struct SplashStore {
  public init() { }

  public struct State: Equatable {
    public init() { }

    @BindingState var destination: Routing.Destination?
  }

  public enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case moveToOnboarding
  }

  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .moveToOnboarding:
        state.destination = .onBoarding
        return .none
      }
    }
  }
}
