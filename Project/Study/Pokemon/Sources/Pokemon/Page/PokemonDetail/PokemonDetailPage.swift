import SwiftUI
import ComposableArchitecture
import DesignSystem
import Domain

public struct PokemonDetailPage {
  private let store: StoreOf<PokemonDetailStore>
  @ObservedObject private var viewStore: ViewStoreOf<PokemonDetailStore>

  public init(store: StoreOf<PokemonDetailStore>) {
    self.store = store
    viewStore = ViewStore(store)
  }
}

extension PokemonDetailPage: View {

  public var body: some View {
    VStack(spacing: .zero) {
      EmptyView()
    }
  }
}

struct PokemonDetailPagee_Previews: PreviewProvider {
  static var previews: some View {
    PokemonDetailPage(
      store: .init(
        initialState: PokemonDetailStore.State(),
        reducer: PokemonDetailStore()
      )
    )
  }
}
