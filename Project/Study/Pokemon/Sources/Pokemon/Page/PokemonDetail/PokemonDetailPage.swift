import SwiftUI
import ComposableArchitecture
import DesignSystem
import Domain

public struct PokemonDetailPage {
  private let store: StoreOf<PokemonDetailStore>
  @ObservedObject private var viewStore: ViewStoreOf<PokemonDetailStore>

  public init(store: StoreOf<PokemonDetailStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }
}

extension PokemonDetailPage {
  private var navigationViewState: NavigationComponent.ViewState {
    .init(title: "Bulbasaur", number: "001")
  }
  private var navigationViewAction: (NavigationComponent.ViewAction) -> Void {
    { viewAction in
      switch viewAction {
      case .back: viewStore.send(.onRouteBack)
      }
    }
  }
}

extension PokemonDetailPage {
  private var pokeImageViewState: PokemonImage.ViewState {
    .init(isFirst: false, imageURL: "")
  }
  private var pokeImageViewAction: (PokemonImage.ViewAction) -> Void {
    { viewAction in
      switch viewAction {
      case .left: viewStore.send(.onRouteLeft)
      case .right: viewStore.send(.onRouteRight)
      }
    }
  }
}

extension PokemonDetailPage: View {

  public var body: some View {
    VStack(spacing: .zero) {
      NavigationComponent(viewState: navigationViewState, viewAction: navigationViewAction)
      PokemonImage(viewState: pokeImageViewState, viewAction: pokeImageViewAction)
    }
    .background(PokemonColor.PokemonType.Grass.Color)
  }
}

struct PokemonDetailPagee_Previews: PreviewProvider {
  static var previews: some View {
    PokemonDetailPage(
      store: .init(
        initialState: PokemonDetailStore.State(),
        reducer: {
          PokemonDetailStore()
        })
    )
  }
}
