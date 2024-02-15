import SwiftUI
import SwiftUINavigation
import ComposableArchitecture

@ViewAction(for: BankingTabStore.self)
public struct BankingTabPage {
  @Bindable
  public var store: StoreOf<BankingTabStore>

  @Environment(\.theme)
  private var theme

  public init(store: StoreOf<BankingTabStore>) {
    self.store = store
  }
}

extension BankingTabPage: View {
  public var body: some View {
    TabView(selection: $store.selecteIndex) {
      Routing.Builder.home()
        .tabItem {
          Image(systemName: "house")
          Text("Home")
        }
        .tag(0)

      Routing.Builder.myCard()
        .tabItem {
          Image(systemName: "creditcard")
          Text("My Card")
        }
        .tag(1)

      Routing.Builder.statistics()
        .tabItem {
          Image(systemName: "chart.pie")
          Text("statistics")
        }
        .tag(2)
    }
    .accentColor(theme.colors.primary)
    .onAppear {
      UITabBar.appearance().backgroundColor = UIColor(theme.colors.tabBackground)
    }
  }
}
