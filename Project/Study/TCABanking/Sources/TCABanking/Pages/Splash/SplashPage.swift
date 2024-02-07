import SwiftUI
import SwiftUINavigation
import ComposableArchitecture

@ViewAction(for: SplashStore.self)
public struct SplashPage {
  @Bindable
  public var store: StoreOf<SplashStore>

  @Environment(\.theme)
  private var theme

  public init(store: StoreOf<SplashStore>) {
    self.store = store
  }
}

extension SplashPage: View {
  public var body: some View {
    VStack {
      Spacer()
      VStack(spacing: 9) {
        Image("Logo_m", bundle: .module)
          .resizable()
          .frame(width: 80, height: 80)
        Text("BANKPICK")
          .font(.system(size: 35))
          .fontWeight(.semibold)
          .foregroundColor(theme.colors.primaryText)
      }

      Spacer()

      Button(action: { send(.moveToOnboarding) }) {
        Text("Onboarding")
      }
    }
    .frame(maxWidth: .infinity)
    .background(theme.colors.background)
    .navigationDestination(unwrapping: $store.destination.onBoarding) { _ in
      Routing.Builder.onBoarding()
    }
    .onAppear {
      UITabBar.appearance().barTintColor = UIColor(theme.colors.secondText)
      UITabBar.appearance().backgroundColor = UIColor(theme.colors.tabBackground)
    }
  }
}
