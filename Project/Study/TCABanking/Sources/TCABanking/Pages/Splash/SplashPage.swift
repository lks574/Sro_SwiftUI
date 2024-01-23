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

extension SplashPage {
  @CasePathable
  enum Destination {
    case onBoarding
    case login
    case home
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
    }
    .frame(maxWidth: .infinity)
    .background(theme.colors.background)
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

