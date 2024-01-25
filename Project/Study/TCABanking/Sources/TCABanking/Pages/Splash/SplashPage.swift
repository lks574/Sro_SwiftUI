import SwiftUI
import SwiftUINavigation
import ComposableArchitecture

public struct SplashPage {
  private let store: StoreOf<SplashStore>
  @ObservedObject private var viewStore: ViewStoreOf<SplashStore>

  @Environment(\.theme) private var theme

  public init(store: StoreOf<SplashStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }
}

extension SplashPage: View {
  public var body: some View {
    VStack {
      Spacer()
      VStack(spacing: 9) {
        Image("Logo_m")
          .resizable()
          .frame(width: 80, height: 80)
        Text("BANKPICK")
          .font(.system(size: 35))
          .fontWeight(.semibold)
          .foregroundColor(theme.colors.primaryText)
      }

      Spacer()

      Button(action: { viewStore.send(.moveToOnboarding) }) {
        Text("Onboarding")
      }
    }
    .frame(maxWidth: .infinity)
    .background(theme.colors.background)
    .navigationDestination(unwrapping: viewStore.$destination) { _ in
      OnBoardingPage(
        store: .init(
          initialState: OnBoardingStore.State(),
          reducer: {
            OnBoardingStore()
          })
      )
    }
  }
}

#Preview {
  SplashPage(
    store: .init(
      initialState: SplashStore.State(),
      reducer: {
        SplashStore()
      })
  )
}

