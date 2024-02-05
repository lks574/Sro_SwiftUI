import Foundation
import ComposableArchitecture

@Reducer
public struct SplashStore: Sendable {
  public init() { }

  @ObservableState
  public struct State: Equatable {
    public init() { }

    var destination: Routing.Destination?
  }

  public enum Action: ViewAction, Sendable {
    case view(View)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case moveToOnboarding
    }
  }

  public var body: some ReducerOf<Self> {
    BindingReducer(action: \.view)
    Reduce { state, action in
      switch action {
      case .view(.binding):
        return .none

      case .view(.moveToOnboarding):
        state.destination = .onBoarding
        return .none
      }
    }
  }
}
