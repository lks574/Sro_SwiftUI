import Foundation
import ComposableArchitecture

@Reducer
public struct OnBoardingStore: Sendable {
  public init() { }

  @ObservableState
  public struct State: Equatable {
    public init() { }

    var destination: Routing.Destination?
    var selectedItem: Int = .zero
    var onBoardingList: [OnBoardingPage.TabModel] = .onBoardings
  }

  public enum Action: ViewAction, Sendable{
    case view(View)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case onTabNext
    }

  }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .view(.binding):
        return .none
        
      case .view(.onTabNext):
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
