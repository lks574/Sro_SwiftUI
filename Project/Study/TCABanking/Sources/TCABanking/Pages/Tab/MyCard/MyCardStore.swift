import Foundation
import ComposableArchitecture

@Reducer
public struct MyCardStore: Sendable {
  public init() { }

  @ObservableState
  public struct State: Equatable {
    public init() { }

    var spendSlider: Double = .zero
    var isEditing: Bool = false
    var destination: Routing.Destination?
    var amount: Double = 8545
    var maxLimit: Double = 10000
    var ratio: Double = .zero
  }

  public enum Action: ViewAction, BindableAction, Sendable {
    case binding(BindingAction<State>)
    case view(View)

    public enum View: Sendable {
      case onAppear
    }

  }

  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding(\.ratio):
        state.spendSlider = state.maxLimit * state.ratio
        return .none
      case .binding:
        return .none

      case .view(.onAppear):
        state.amount = 8545
        state.maxLimit = 10000
        return .none
      }
    }
  }
}
