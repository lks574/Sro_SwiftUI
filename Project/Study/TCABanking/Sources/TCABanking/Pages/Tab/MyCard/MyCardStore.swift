import Foundation
import ComposableArchitecture

@Reducer
public struct MyCardStore: Sendable {
  public init() { }

  @ObservableState
  public struct State: Equatable {
    public init() { }

    var spendSlider: Double = 3000
    var isEditing: Bool = false
    var destination: Routing.Destination?
    var amount: Double = .zero
    var maxLimit: Double = .zero
    var currentAmount: Double = .zero
  }

  public enum Action: ViewAction, Sendable{
    case view(View)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case onAppear
    }

  }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .view(.binding):
        return .none
      case .view(.onAppear):
        state.amount = 8545
        state.maxLimit = 10000
        state.currentAmount = 4600
        return .none
      }
    }
  }
}
