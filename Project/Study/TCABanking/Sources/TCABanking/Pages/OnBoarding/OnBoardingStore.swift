import Foundation
import ComposableArchitecture

@Reducer
public struct OnBoardingStore {
  public init() { }

  public struct State: Equatable {
    public init() { }

    @CasePathable
    enum Destination {
      case signIn
    }

    @BindingState var destination: Destination?
    @BindingState var selectedItem: Int = .zero
    var onBoardingList: [OnBoardingPage.TabModel] = .onBoardings
  }

  public enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case onTabNext
  }

  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .onTabNext:
        if state.selectedItem >= state.onBoardingList.count - 1 {
          state.destination = .signIn
        } else {
          state.selectedItem += 1
        }
        return .none
      }
    }
  }
}