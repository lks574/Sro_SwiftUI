import Foundation
import ComposableArchitecture

@Reducer
public struct StatisticsStore: Sendable {
  public init() { }

  @ObservableState
  public struct State: Equatable {
    public init() { }

    var destination: Routing.Destination?
    var amount: Int = .zero
  }

  public enum Action: ViewAction, Sendable {
    case view(View)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case onTapChartAmount(Int)
    }
  }

  public var body: some ReducerOf<Self> {
    BindingReducer(action: \.view)
    Reduce { state, action in
      switch action {
      case .view(.binding):
        return .none

      case .view(.onTapChartAmount(let amount)):
        state.amount = amount
        return .none
      }
    }
  }
}
