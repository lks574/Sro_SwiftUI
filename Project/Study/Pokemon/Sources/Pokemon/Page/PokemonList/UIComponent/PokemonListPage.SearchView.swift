import SwiftUI
import DesignSystem

extension PokemonListPage {
  public struct SearchView {
    let viewState: ViewState
    let viewAction: ViewAction
  }
}

extension PokemonListPage.SearchView: Equatable {
  public struct ViewState: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
      lhs.sortType == rhs.sortType
      && lhs.searchText == rhs.searchText
    }

    let sortType: PokemonListStore.SortType
    @Binding var searchText: String


    public var searchImage: String {
      switch sortType {
      case .number: return "tag"
      case .name: return "text_format"
      }
    }
  }

  public struct ViewAction: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
      true
    }

    let typeAction: () -> Void
  }
}

extension PokemonListPage.SearchView: View {
  public var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 16) {
        Image("pokeball", bundle: .module)
          .resizable()
          .frame(width: 24, height: 24)
          .foregroundColor(PokemonColor.Grayscale.White.Color)

        Text("Pokédex")
          .font(PokemonFont.Header.headline)
          .foregroundColor(PokemonColor.Grayscale.White.Color)
      }
      HStack(spacing: 16) {
        HStack(spacing: 8) {
          Image("search", bundle: .module)
            .resizable()
            .frame(width: 16, height: 16)
            .foregroundColor(PokemonColor.Identity.Primary.Color)

          TextField(
            "Title",
            text: viewState.$searchText,
            prompt: Text("Search")
              .font(PokemonFont.Body.body3)
              .foregroundColor(PokemonColor.Grayscale.Medium.Color)
          )
          .font(PokemonFont.Body.body3)
          .foregroundColor(PokemonColor.Grayscale.Dark.Color)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(PokemonColor.Grayscale.White.Color)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.2), radius: 1.5, x: 0, y: 1)

        Button(action: viewAction.typeAction) {
          Image(viewState.searchImage, bundle: .module)
            .resizable()
            .frame(width: 16, height: 16)
            .foregroundColor(PokemonColor.Identity.Primary.Color)
            .padding(8)
            .background(PokemonColor.Grayscale.White.Color)
            .clipShape(Circle())
        }
      }
    }
    .padding(12)
    .background(PokemonColor.Identity.Primary.Color)
  }
}

struct PokemonListPage_SearchView_Previews: PreviewProvider {
  static var previews: some View {
    PokemonListPage.SearchView(
      viewState: .init(
        sortType: .number,
        searchText: .constant("")),
      viewAction: .init(
        typeAction: { })
    )
    .previewLayout(PreviewLayout.sizeThatFits)
  }
}

