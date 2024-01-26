import SwiftUI
import ComposableArchitecture

public struct SignInPage {
  private let store: StoreOf<SignInStore>
  @ObservedObject private var viewStore: ViewStoreOf<SignInStore>

  @Environment(\.theme) private var theme

  public init(store: StoreOf<SignInStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }
}

extension SignInPage: View {
  public var body: some View {
    VStack(spacing: 40) {
      Text("Sign In")
        .font(.system(size: 32))
        .fontWeight(.medium)
        .foregroundStyle(theme.colors.primaryText)
        .frame(maxWidth: .infinity, alignment: .leading)

      VStack(spacing: 20) {
        InputTextField(
          viewState: .init(
            title: "Email Address",
            image: "email-mail-letter",
            hint: "email",
            bindingString: viewStore.$email)
        )
        SecureInputTextField(
          viewState: .init(
            title: "Password",
            image: "lock-password",
            hint: "password",
            isShowPassword: viewStore.isShowPassword,
            onTapShowPassword: { viewStore.send(.onTapPasswordShow) },
            bindingString: viewStore.$password)
        )
      }

      VStack(spacing: 30) {
        Button(action: { viewStore.send(.onTapSignIn) }) {
          Text("Sign In")
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(theme.colors.primary)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        } 
        HStack(spacing: 4) {
          Text("I’m a new user.")
            .font(.system(size: 14))
            .foregroundStyle(theme.colors.secondText)

          Button(action: { viewStore.send(.onTapSignUp) }) {
            Text("Sign Up")
              .font(.system(size: 14))
              .foregroundStyle(theme.colors.primary)
          }
        }
      }
    }
    .padding(.horizontal, 20)
  }
}
