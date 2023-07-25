import SwiftUI
import ComposableArchitecture
import DesignSystem
import Domain
import Architecture

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
    .init(cards: .serialized(rawValue: viewStore.pokeList))
  }

  private var pokemonComponentViewAction: PokemonComponent.ViewAction {
    .init(lastPokeAppear: { viewStore.send(.getPokeList($0)) })
  }
}

extension PokemonListPage {
  private var searchViewState: SearchView.ViewState {
    .init(sortType: viewStore.sortType, searchText: viewStore.$searchText)
  }

  private var searchViewAction: SearchView.ViewAction {
    .init(typeAction: { viewStore.send(.onTapSearchType) })
  }
}

extension PokemonListPage {
  private var sortCardViewState: SortCardDialog.ViewState {
    .init(sortType: viewStore.sortType)
  }

  private var sortCardViewAction: SortCardDialog.ViewAction {
    .init(sortAction: { viewStore.send(.onChangeSortType($0)) })
  }
}

extension PokemonListPage: View {

  public var body: some View {
    VStack(spacing: .zero) {
      SearchView(
        viewState: searchViewState,
        viewAction: searchViewAction)
      ScrollView(.vertical, showsIndicators: false) {
        PokemonComponent(
          viewState: pokemonComponentViewState,
          viewAction: pokemonComponentViewAction
        )
        .padding(.vertical, 24)
        .padding(.horizontal, 12)
        .background(PokemonColor.Grayscale.White.Color)
        .cornerRadius(8)
        .padding(4)
      }
      .background(PokemonColor.Identity.Primary.Color)
    }
    .onAppear {
      viewStore.send(.getPokeList(.zero))
    }
    .customDialog(
      unwrapping: viewStore.binding(\.$route),
      case: /PokemonListStore.Route.sortCard,
      cornerRadius: 10)
    { _ in
      PokemonListPage.SortCardDialog(
        viewState: sortCardViewState,
        viewAction: sortCardViewAction)
    }
  }
}


extension [PokemonListPage.PokemonCard.ViewState] {
  fileprivate static func serialized(rawValue: [PokemonRepository.Pokemon]) -> Self {
    return rawValue.map {
      let number = Int(String($0.url.split(separator: "/").last ?? "")) ?? .zero
      return .init(url: $0.url, name: $0.name, number: number)
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
