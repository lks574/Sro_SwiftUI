import SwiftUI
import Pokemon
import ComposableArchitecture

@main
struct AppMain: App {

  var body: some Scene {
    WindowGroup {
      NavigationView {
        PokemonListPage(
          store: .init(
            initialState: PokemonListStore.State(),
            reducer: PokemonListStore()
          )
        )
      }
    }
  }
}
