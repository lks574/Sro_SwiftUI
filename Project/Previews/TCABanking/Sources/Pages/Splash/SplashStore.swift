import Foundation
import ComposableArchitecture

@Reducer
struct SplashStore {
  init() { }

  struct State: Equatable {

  }

  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
  }

  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
      }
    }
  }
}
