import Foundation
import ComposableArchitecture

@Reducer
public struct HomeStore: Sendable {
  public init() { }

  @ObservableState
  public struct State: Equatable {
    public init() { }

    var destination: Routing.Destination?
  }

  public enum Action: ViewAction, Sendable{
    case view(View)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case onTapSearch
      case onTapSent
      case onTapReceive
      case onTapLoan
      case onTapTopup
      case onTapSellAll
    }

  }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .view(.binding):
        return .none
      case .view(.onTapSearch):
        return .none
      case .view(.onTapSent):
        return .none
      case .view(.onTapReceive):
        return .none
      case .view(.onTapLoan):
        return .none
      case .view(.onTapTopup):
        return .none
      case .view(.onTapSellAll):
        return .none
      }
    }
  }
}
