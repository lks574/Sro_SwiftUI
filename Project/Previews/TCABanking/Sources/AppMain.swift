import SwiftUI
import TCABanking

@main
struct AppMain: App {

  var body: some Scene {
    WindowGroup {
      NavigationStack {
        Routing.Builder.tab()
      }
    }
  }
}
