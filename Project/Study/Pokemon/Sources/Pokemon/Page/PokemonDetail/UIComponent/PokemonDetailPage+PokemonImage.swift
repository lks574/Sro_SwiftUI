import SwiftUI
import DesignSystem

extension PokemonDetailPage {
  public struct PokemonImage: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
      lhs.viewState == rhs.viewState
    }

    let viewState: ViewState
    let viewAction: (ViewAction) -> Void
  }
}

extension PokemonDetailPage.PokemonImage {
  public struct ViewState: Equatable {
    public let isFirst: Bool
    public let imageURL: String
  }

  public enum ViewAction: Equatable {
    case left
    case right
  }
}

extension PokemonDetailPage.PokemonImage: View {
  public var body: some View {
    HStack {
      Button(action: { viewAction(.right) }) {
        Image("chevron_left", bundle: .module)
          .frame(width: 24, height: 24)
          .foregroundColor(PokemonColor.Grayscale.White.Color)
      }
      .disabled(viewState.isFirst)

      Spacer()

      AsyncImage(url: URL(string: viewState.imageURL)) { phase in
        phase.image?.resizable()
      }
      .frame(width: 200, height: 200)

      Spacer()

      Button(action: { viewAction(.left) }) {
        Image("chevron_right", bundle: .module)
          .frame(width: 24, height: 24)
          .foregroundColor(PokemonColor.Grayscale.Background.Color)
      }
    }
    .padding(.horizontal, 24)
  }
}

struct PokemonDetailPagee_PokemonImage_Previews: PreviewProvider {
  static var previews: some View {
    PokemonDetailPage.PokemonImage(
      viewState: .init(
        isFirst: false,
        imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")) { _ in

      }
        .previewLayout(PreviewLayout.sizeThatFits)
  }
}
