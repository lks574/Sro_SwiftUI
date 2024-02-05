import SwiftUI
import SwiftUINavigation
import ComposableArchitecture

@ViewAction(for: SignInStore.self)
public struct SignInPage {
  
  @Bindable
  public var store: StoreOf<SignInStore>

  @Environment(\.theme)
  private var theme

  public init(store: StoreOf<SignInStore>) {
    self.store = store
  }
}

extension SignInPage: View {
  public var body: some View {
    ScrollView(.vertical) {
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
              image: "envelope",
              hint: "email",
              bindingString: $store.email)
          )
          SecureInputTextField(
            viewState: .init(
              title: "Password",
              image: "lock",
              hint: "password",
              isShowPassword: store.isShowPassword,
              onTapShowPassword: { send(.onTapPasswordShow) },
              bindingString: $store.password)
          )
        }

        VStack(spacing: 30) {
          Button(action: { send(.onTapSignIn) }) {
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

            Button(action: { send(.onTapSignUp) }) {
              Text("Sign Up")
                .font(.system(size: 14))
                .foregroundStyle(theme.colors.primary)
            }
          }
        }
      }
      .padding(.horizontal, 20)
      .padding(.vertical, 50)
    }
    .toolbar(.hidden, for: .navigationBar)
    .navigationDestination(unwrapping: $store.destination.signUp) { _ in
      Routing.Builder.signUp()
    }
  }
}
