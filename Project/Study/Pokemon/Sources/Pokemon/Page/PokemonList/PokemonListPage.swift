import SwiftUI
import ComposableArchitecture
import DesignSystem
import Domain

public struct PokemonListPage {
  private let store: StoreOf<PokemonListStore>
  @ObservedObject private var viewStore: ViewStoreOf<PokemonListStore>

  public init(store: StoreOf<PokemonListStore>) {
    self.store = store
    viewStore = ViewStore(store)
  }
}

extension PokemonListPage {
  private var pokemonComponentViewState: PokemonComponent.ViewState {
    .init(cards: .serialized(rawValue: viewStore.results))
  }
}

extension PokemonListPage {
  private var searchViewState: SearchView.ViewState {
    .init(sortType: .name, searchText: viewStore.$searchText)
  }

  private var searchViewAction: SearchView.ViewAction {
    .init(typeAction: { viewStore.send(.onTapSearchType($0)) })
  }
}

extension PokemonListPage: View {

  public var body: some View {
    VStack(spacing: .zero) {
      SearchView(
        viewState: searchViewState,
        viewAction: searchViewAction)
      ScrollView(.vertical, showsIndicators: false) {
        PokemonComponent(viewState: pokemonComponentViewState)
          .padding(.vertical, 24)
          .padding(.horizontal, 12)
          .background(PokemonColor.Grayscale.White.Color)
          .cornerRadius(8)
          .padding(4)
      }
      .background(PokemonColor.Identity.Primary.Color)
    }
    .onAppear {
      viewStore.send(.getPokeList)
    }
  }
}


extension [PokemonListPage.PokemonCard.ViewState] {
  fileprivate static func serialized(rawValue: PokemonRepository.PokemonList?) -> Self {
    guard let rawValue else { return [] }
    return rawValue.pokemons.map {
      .init(url: $0.url, name: $0.name, number: String($0.url.split(separator: "/").last ?? ""))
    }
  }
}

struct PokemonListPage_Previews: PreviewProvider {
  static var previews: some View {
    PokemonListPage(
      store: .init(
        initialState: PokemonListStore.State(),
        reducer: PokemonListStore()
      )
    )
  }
}
