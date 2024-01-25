import Foundation
import ComposableArchitecture

@Reducer
public struct SplashStore {
  public init() { }

  public struct State: Equatable {
    public init() { }

    @CasePathable
    enum Destination {
      case onBoarding
      case login
      case home
    }

    @BindingState var destination: Destination?
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
