import Foundation
import ComposableArchitecture

@Reducer
public struct SignInStore {
  public init() { }

  public struct State: Equatable {
    public init() { }

    @CasePathable
    enum Destination {
      case signUp
    }

    @BindingState var email: String = ""
    @BindingState var password: String = ""
    @BindingState var destination: Destination?

    var isShowPassword: Bool = false
  }

  public enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case onTapSignIn
    case onTapSignUp
    case onTapPasswordShow
  }

  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding(\.$password):
        state.isShowPassword = false
        return .none
      case .binding:
        return .none

      case .onTapSignIn:
        return .none

      case .onTapSignUp:
        state.destination = .signUp
        return .none

      case .onTapPasswordShow:
        state.isShowPassword = true
        return .none
      }
    }
  }
}