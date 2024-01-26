import SwiftUI
import ComposableArchitecture

public struct SignUpPage {
  private let store: StoreOf<SignUpStore>
  @ObservedObject private var viewStore: ViewStoreOf<SignUpStore>

  @Environment(\.theme) private var theme
  @Environment(\.dismiss) private var dismiss

  public init(store: StoreOf<SignUpStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }
}

extension SignUpPage: View {
  public var body: some View {
    ScrollView(.vertical) {
      VStack(spacing: 40) {
        Text("Sign Up")
          .font(.system(size: 32))
          .fontWeight(.medium)
          .foregroundStyle(theme.colors.primaryText)
          .frame(maxWidth: .infinity, alignment: .leading)

        VStack(spacing: 20) {
          InputTextField(
            viewState: .init(
              title: "Full Name",
              image: "person",
              hint: "FullName",
              bindingString: viewStore.$name)
          )
          InputTextField(
            viewState: .init(
              title: "Phone Number",
              image: "phone",
              hint: "Number",
              bindingString: viewStore.$phone)
          )
          InputTextField(
            viewState: .init(
              title: "Email Address",
              image: "envelope",
              hint: "email",
              bindingString: viewStore.$email)
          )
          SecureInputTextField(
            viewState: .init(
              title: "Password",
              image: "lock",
              hint: "password",
              isShowPassword: viewStore.isShowPassword,
              onTapShowPassword: { viewStore.send(.onTapPasswordShow) },
              bindingString: viewStore.$password)
          )
        }

        VStack(spacing: 30) {
          Button(action: { viewStore.send(.onTapSignUp) }) {
            Text("Sign Up")
              .font(.system(size: 16))
              .fontWeight(.semibold)
              .foregroundStyle(Color.white)
              .padding(16)
              .frame(maxWidth: .infinity)
              .background(theme.colors.primary)
              .clipShape(RoundedRectangle(cornerRadius: 16))
          }
          HStack(spacing: 4) {
            Text("Already have an account.")
              .font(.system(size: 14))
              .foregroundStyle(theme.colors.secondText)

            Button(action: { dismiss() }) {
              Text("Sign In")
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
  }
}
