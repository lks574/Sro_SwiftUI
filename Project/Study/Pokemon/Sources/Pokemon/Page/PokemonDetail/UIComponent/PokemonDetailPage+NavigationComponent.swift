import SwiftUI
import DesignSystem

extension PokemonDetailPage {
  public struct NavigationComponent: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
      lhs.viewState == rhs.viewState
    }

    let viewState: ViewState
    let viewAction: (ViewAction) -> Void
  }
}

extension PokemonDetailPage.NavigationComponent {
  public struct ViewState: Equatable {
    public let title: String
    public let number: String
  }

  public enum ViewAction: Equatable {
    case back
  }
}

extension PokemonDetailPage.NavigationComponent: View {
  public var body: some View {
    HStack(spacing: 8) {
      Button(action: {}) {
        Image("arrow_back", bundle: .module)
          .resizable()
          .frame(width: 32, height: 32)
          .foregroundColor(PokemonColor.Grayscale.White.Color)
      }

      Text(viewState.title)
        .font(PokemonFont.Header.headline)
        .foregroundColor(PokemonColor.Grayscale.White.Color)

      Spacer()

      Text("#\(viewState.number)")
        .font(PokemonFont.Header.subtitle2)
        .foregroundColor(PokemonColor.Grayscale.White.Color)
    }
    .padding(20)
  }
}

struct PokemonDetailPagee_NavigationComponent_Previews: PreviewProvider {
  static var previews: some View {
    PokemonDetailPage.NavigationComponent(
      viewState: .init(
        title: "Bulbasaur",
        number: "001")) { _ in

        }
        .previewLayout(PreviewLayout.sizeThatFits)
  }
}

