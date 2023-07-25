import SwiftUI
import DesignSystem

extension PokemonListPage {
  public struct PokemonComponent {
    let viewState: ViewState
    let viewAction: ViewAction

    init(viewState: ViewState, viewAction: ViewAction) {
      self.viewState = viewState
      self.viewAction = viewAction
    }
  }
}

extension PokemonListPage.PokemonComponent: Equatable {
  public struct ViewState: Equatable {
    public let cards: [PokemonListPage.PokemonCard.ViewState]

    public init(cards: [PokemonListPage.PokemonCard.ViewState]) {
      self.cards = cards
    }
  }

  public struct ViewAction: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool { true }
    let lastPokeAppear: (Int) -> Void
  }
}

extension PokemonListPage.PokemonComponent: View {

  public var body: some View {
    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
      ForEach(viewState.cards, id: \.id) { poke in
        PokemonListPage.PokemonCard(viewState: poke)
          .onAppear {
            if poke == viewState.cards.last { viewAction.lastPokeAppear(poke.id) }
          }
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
            number: 1),
          .init(
            url: "image_0",
            name: "Pokémon Name",
            number: 2),
          .init(
            url: "image_0",
            name: "Pokémon Name",
            number: 3),
          .init(
            url: "image_0",
            name: "Pokémon Name",
            number: 4),
          .init(
            url: "image_0",
            name: "Pokémon Name",
            number: 5)
        ]),
      viewAction: .init(lastPokeAppear: { _ in })
    )
  }
}
