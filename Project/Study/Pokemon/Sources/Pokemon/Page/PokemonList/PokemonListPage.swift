import SwiftUI
import ComposableArchitecture
import DesignSystem

public struct PokemonListPage {
  private let store: StoreOf<PokemonListStore>
  @ObservedObject private var viewStore: ViewStoreOf<PokemonListStore>

  public init(store: StoreOf<PokemonListStore>) {
    self.store = store
    viewStore = ViewStore(store)
  }
}

extension PokemonListPage: View {

  public var body: some View {
    VStack {
      Text("PokemonListPage")
    }
    .onAppear {
      viewStore.send(.getPokeList)
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
