import SwiftUI
import DesignSystem

extension PokemonListPage {
  public struct PokemonComponent {
    let viewState: ViewState

    init(viewState: ViewState) {
      self.viewState = viewState
    }
  }
}

extension PokemonListPage.PokemonComponent {
  public struct ViewState: Equatable {
    public let cards: [PokemonListPage.PokemonCard.ViewState]

    public init(cards: [PokemonListPage.PokemonCard.ViewState]) {
      self.cards = cards
    }
  }
}

extension PokemonListPage.PokemonComponent: View {

  public var body: some View {
    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
      ForEach(viewState.cards, id: \.id) {
        PokemonListPage.PokemonCard(viewState: $0)
      }
    }
  }
}

struct PokemonListPage_PokemonComponent_Previews: PreviewProvider {
  static var previews: some View {
    PokemonListPage.PokemonComponent(
      viewState: .init(
        cards: [
          .init(
            url: "image_0",
            name: "Pokémon Name",
            number: "1"),
          .init(
            url: "image_0",
            name: "Pokémon Name",
            number: "2"),
          .init(
            url: "image_0",
            name: "Pokémon Name",
            number: "3"),
          .init(
            url: "image_0",
            name: "Pokémon Name",
            number: "4"),
          .init(
            url: "image_0",
            name: "Pokémon Name",
            number: "5")
        ])
    )
  }
}
