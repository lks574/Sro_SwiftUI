import Foundation
import ComposableArchitecture

@Reducer
public struct BankingTabStore: Sendable {
  public init() { }

  @ObservableState
  public struct State: Equatable {
    public init() { }

    var destination: Routing.Destination?
    var selecteIndex: Int = .zero
  }

  public enum Action: ViewAction, Sendable{
    case view(View)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
    }

  }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .view(.binding):
        return .none

      }
    }
  }
}

