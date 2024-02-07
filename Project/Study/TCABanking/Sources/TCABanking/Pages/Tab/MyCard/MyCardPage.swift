import SwiftUI
import SwiftUINavigation
import ComposableArchitecture

@ViewAction(for: MyCardStore.self)
public struct MyCardPage {
  @Bindable
  public var store: StoreOf<MyCardStore>

  @Environment(\.theme)
  private var theme

  public init(store: StoreOf<MyCardStore>) {
    self.store = store
  }
}

extension MyCardPage: View {
  public var body: some View {
    VStack {
      Text("MyCardPage")
    }
    .background(theme.colors.background)
  }
}
