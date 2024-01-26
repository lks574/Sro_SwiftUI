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

/// - Note: email & password

extension SignInPage {

  private struct InputViewState {
    let title: String
    let image: String
    let hint: String
    let isShowPassword: Bool
    let bindingString: Binding<String>
  }

  private func emailInput(viewState: InputViewState) -> some View {
    VStack(spacing: 16) {
      Text(viewState.title)
        .font(.system(size: 14))
        .foregroundStyle(theme.colors.secondText)
        .frame(maxWidth: .infinity, alignment: .leading)

      HStack(spacing: 16) {
        Image(viewState.image)
          .foregroundStyle(theme.colors.secondText)

        TextField(text: viewState.bindingString) {
          Text(viewState.hint)
            .font(.system(size: 14))
            .foregroundStyle(theme.colors.secondText)
        }
        .textFieldStyle(.plain)
        .font(.system(size: 14))
        .foregroundStyle(theme.colors.primaryText)

        Spacer(minLength: .zero)
      }

      Rectangle()
        .frame(height: 1)
        .foregroundStyle(theme.colors.separator)
    }
  }

  private func secureInput(viewState: InputViewState) -> some View {
    VStack(spacing: 16) {
      Text(viewState.title)
        .font(.system(size: 14))
        .foregroundStyle(theme.colors.secondText)
        .frame(maxWidth: .infinity, alignment: .leading)

      HStack(spacing: 16) {
        Image(viewState.image)
          .foregroundStyle(theme.colors.secondText)

        Group {
          if !viewState.isShowPassword {
            SecureField(text: viewState.bindingString) {
              Text(viewState.hint)
                .font(.system(size: 14))
                .foregroundStyle(theme.colors.secondText)
            }
          } else {
            TextField(text: viewState.bindingString) {
              Text(viewState.hint)
                .font(.system(size: 14))
                .foregroundStyle(theme.colors.secondText)
            }
          }
        }
        .textFieldStyle(.plain)
        .font(.system(size: 14))
        .foregroundStyle(theme.colors.primaryText)

        Spacer()

        if !viewState.isShowPassword && !viewState.bindingString.wrappedValue.isEmpty {
          Button(action: { viewStore.send(.onTapPasswordShow)  }) {
            Image("eye-show-up-arrow")
              .foregroundStyle(theme.colors.secondText)
          }
        }
      }

      Rectangle()
        .frame(height: 1)
        .foregroundStyle(theme.colors.separator)
    }
  }

  @ViewBuilder
  private var inputText: some View {
    VStack(spacing: 18) {
      Text("Email Address")
        .font(.system(size: 14))
        .foregroundStyle(theme.colors.secondText)
        .frame(maxWidth: .infinity, alignment: .leading)

      HStack(spacing: 16) {
        Image("email-mail-letter")
          .foregroundStyle(theme.colors.secondText)
        SecureField(text: viewStore.$email) {
          Text("email")
            .font(.system(size: 14))
            .foregroundStyle(theme.colors.secondText)
        }
        .font(.system(size: 14))
        .foregroundStyle(theme.colors.primaryText)
      }
      .overlay(alignment: .bottom) {
        Rectangle()
          .stroke(theme.colors.separator)
      }
    }
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
        emailInput(
          viewState: .init(
            title: "Email Address",
            image: "email-mail-letter",
            hint: "email",
            isShowPassword: false,
            bindingString: viewStore.$email)
        )

        secureInput(
          viewState: .init(
            title: "Password",
            image: "lock-password",
            hint: "password",
            isShowPassword: viewStore.isShowPassword,
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
