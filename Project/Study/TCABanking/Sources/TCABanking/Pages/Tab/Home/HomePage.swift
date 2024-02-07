import SwiftUI
import SwiftUINavigation
import ComposableArchitecture

@ViewAction(for: HomeStore.self)
public struct HomePage {
  @Bindable
  public var store: StoreOf<HomeStore>

  @Environment(\.theme)
  private var theme

  public init(store: StoreOf<HomeStore>) {
    self.store = store
  }
}

extension HomePage: View {
  public var body: some View {
    VStack {
      Text("HomePage")
    }
    .background(theme.colors.background)
  }
}
