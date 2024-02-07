import SwiftUI
import SwiftUINavigation
import ComposableArchitecture

@ViewAction(for: OnBoardingStore.self)
public struct OnBoardingPage {
  @Bindable
  public var store: StoreOf<OnBoardingStore>

  @Environment(\.theme) 
  private var theme

  public init(store: StoreOf<OnBoardingStore>) {
    self.store = store
  }
}

/// - Note: Component
extension OnBoardingPage {

  fileprivate func onBoardingTabView(
    tabModel: TabModel) -> some View
  {
    VStack(spacing: .zero) {
      Spacer()
      Image(tabModel.image, bundle: .module)
      Spacer()
      VStack(spacing: 10) {
        Text(tabModel.title)
          .font(.system(size: 26))
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
          .foregroundStyle(theme.colors.primaryText)

        Text(tabModel.subTitle)
          .font(.system(size: 14))
          .fontWeight(.regular)
          .multilineTextAlignment(.center)
          .foregroundStyle(theme.colors.secondText)
      }
      .padding(.bottom, 52)

      Button(action: { send(.onTabNext) }) {
        Text("Next")
          .font(.system(size: 16))
          .fontWeight(.semibold)
          .foregroundStyle(Color.white)
          .padding(16)
          .frame(maxWidth: .infinity)
          .background(theme.colors.primary)
      }
      .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    .padding(.horizontal, 20)
    .background(theme.colors.background)
  }
}

extension OnBoardingPage: View {
  public var body: some View {
    TabView(selection: $store.selectedItem) {
      ForEach(store.onBoardingList, id: \.id) { tabModel in
        onBoardingTabView(tabModel: tabModel)
      }
    }
    .frame(maxWidth: .infinity)
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .animation(.easeInOut(duration: 0.2), value: store.selectedItem)
    .background(theme.colors.background)
    .toolbar(.hidden, for: .navigationBar)
    .navigationDestination(unwrapping: $store.destination.signIn) { _ in
      Routing.Builder.signIn()
    }
  }
}
