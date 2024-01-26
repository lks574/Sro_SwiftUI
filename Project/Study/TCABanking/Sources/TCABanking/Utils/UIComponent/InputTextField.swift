import SwiftUI

struct InputTextField {
  @Environment(\.theme) private var theme

  let viewState: ViewState
}

extension InputTextField {
  struct ViewState {
    let title: String
    let image: String
    let hint: String
    let bindingString: Binding<String>
  }
}

extension InputTextField: View {
  var body: some View {
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
}
