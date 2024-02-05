import Foundation
import ComposableArchitecture

@Reducer
public struct SignUpStore: Sendable {
  public init() { }

  @ObservableState
  public struct State: Equatable {
    public init() { }

    var name: String = ""
    var phone: String = ""
    var email: String = ""
    var password: String = ""

    var isShowPassword: Bool = false
  }

  public enum Action: ViewAction, Sendable {
    case view(View)

    public enum View: BindableAction, Sendable {
      case binding(BindingAction<State>)
      case onTapSignIn
      case onTapSignUp
      case onTapPasswordShow
    }
  }

  public var body: some ReducerOf<Self> {
    BindingReducer(action: \.view)
    Reduce { state, action in
      switch action {
      case .view(.binding(\.password)):
        state.isShowPassword = false
        return .none

      case .view(.binding):
        return .none

      case .view(.onTapSignIn):
        return .none

      case .view(.onTapSignUp):
        return .none

      case .view(.onTapPasswordShow):
        state.isShowPassword = true
        return .none
      }
    }
  }
}
