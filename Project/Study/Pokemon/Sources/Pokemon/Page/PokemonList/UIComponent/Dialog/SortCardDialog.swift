import SwiftUI
import DesignSystem

extension PokemonListPage {
  struct SortCardDialog {
    let viewState: ViewState
    let viewAction: ViewAction

    init(viewState: ViewState, viewAction: ViewAction) {
      self.viewState = viewState
      self.viewAction = viewAction
    }
  }
}

extension PokemonListPage.SortCardDialog {
  public struct ViewState: Equatable {
    let sortType: PokemonListStore.SortType
  }

  public struct ViewAction {
    let sortAction: (PokemonListStore.SortType) -> Void
  }
}

extension PokemonListPage.SortCardDialog: View {
  var body: some View {
    VStack(spacing: 16) {
      Text("Sort by:")
        .font(PokemonFont.Header.subtitle2)
        .foregroundColor(PokemonColor.Grayscale.White.Color)
        .padding(.top, 16)

      VStack(alignment: .leading, spacing: 16) {
        Button(action: { viewAction.sortAction(.number) }) {
          HStack(spacing: 8) {
            Image(viewState.sortType == .number ? "radio_button_checked" : "radio_button_unchecked", bundle: .module)
              .resizable()
              .frame(width: 16, height: 16)
            Text("Number")
              .font(PokemonFont.Body.body3)
              .foregroundColor(PokemonColor.Grayscale.Dark.Color)
          }
        }
        Button(action: { viewAction.sortAction(.name) }) {
          HStack(spacing: 8) {
            Image(viewState.sortType == .name ? "radio_button_checked" : "radio_button_unchecked", bundle: .module)
              .resizable()
              .frame(width: 16, height: 16)
            Text("Name")
              .font(PokemonFont.Body.body3)
              .foregroundColor(PokemonColor.Grayscale.Dark.Color)
          }
        }
      }
      .padding(.vertical, 16)
      .padding(.horizontal, 20)
      .background(PokemonColor.Grayscale.White.Color)
      .cornerRadius(8)
      .padding(EdgeInsets(top: .zero, leading: 4, bottom: 4, trailing: 4))
    }
    .background(PokemonColor.Identity.Primary.Color)
    .cornerRadius(12)
  }
}

struct PokemonListPage_SortCardDialog_Previews: PreviewProvider {
  static var previews: some View {
    PokemonListPage.SortCardDialog(
      viewState: .init(sortType: .name), viewAction: .init(sortAction: { _ in })
    )
    .previewLayout(PreviewLayout.sizeThatFits)
  }
}
