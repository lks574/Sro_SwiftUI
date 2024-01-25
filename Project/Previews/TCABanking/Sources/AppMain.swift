import SwiftUI
import TCABanking

@main
struct AppMain: App {

  var body: some Scene {
    WindowGroup {
      NavigationStack {
        SplashPage(
          store: .init(
            initialState: SplashStore.State(),
            reducer: {
              SplashStore()
            })
        )
      }
    }
  }
}
