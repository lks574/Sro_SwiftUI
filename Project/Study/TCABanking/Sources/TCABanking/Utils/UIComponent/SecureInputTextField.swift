import SwiftUI

struct SecureInputTextField {
  @Environment(\.theme) private var theme

  let viewState: ViewState
}

extension SecureInputTextField {
  struct ViewState {
    let title: String
    let image: String
    let hint: String
    let isShowPassword: Bool
    let onTapShowPassword: () -> Void
    let bindingString: Binding<String>
  }
}

extension SecureInputTextField: View {
  var body: some View {
    VStack(spacing: 16) {
      Text(viewState.title)
        .font(.system(size: 14))
        .foregroundStyle(theme.colors.secondText)
        .frame(maxWidth: .infinity, alignment: .leading)

      HStack(spacing: 16) {
        Image(systemName: viewState.image)
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
          Button(action: viewState.onTapShowPassword) {
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
}
