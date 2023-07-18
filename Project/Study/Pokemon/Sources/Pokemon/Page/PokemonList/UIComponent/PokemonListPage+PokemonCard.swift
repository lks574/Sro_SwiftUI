import SwiftUI
import DesignSystem

extension PokemonListPage {
  public struct PokemonCard {
    let viewState: ViewState

    init(viewState: ViewState) {
      self.viewState = viewState
    }
  }
}

extension PokemonListPage.PokemonCard {
  public struct ViewState: Equatable, Identifiable {

    init(imageString: String, name: String, number: String) {
      self.imageString = imageString
      self.name = name
      self.number = number
    }

    public var id: String { number }
    let imageString: String
    let name: String
    let number: String
  }
}

extension PokemonListPage.PokemonCard: View {
  public var body: some View {
    ZStack(alignment: .bottom) {
      Rectangle()
        .fill(PokemonColor.Grayscale.Background.Color)
        .cornerRadius(8)
        .frame(height: 44)
        .frame(maxWidth: .infinity)

      VStack(spacing: .zero) {
        Text("#\(viewState.number)")
          .font(PokemonFont.Body.caption)
          .foregroundColor(PokemonColor.Grayscale.Medium.Color)
          .frame(maxWidth: .infinity, alignment: .trailing)

        Image(viewState.imageString, bundle: .module)
          .resizable()
          .frame(width: 72, height: 72)

        Text(viewState.name)
          .font(PokemonFont.Body.body3)
          .foregroundColor(PokemonColor.Grayscale.Dark.Color)
      }
    }
    .frame(maxWidth: 108, maxHeight: 104)
    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
    .background(.white)
    .cornerRadius(8)
    .shadow(color: .black.opacity(0.2), radius: 1.5, x: 0, y: 1)
  }
}

struct PokemonListPage_PokemonCard_Previews: PreviewProvider {
  static var previews: some View {
    PokemonListPage.PokemonCard(
      viewState: .init(
        imageString: "image_0",
        name: "Pokémon Name",
        number: "999")
    )
    .previewLayout(PreviewLayout.sizeThatFits)
  }
}
