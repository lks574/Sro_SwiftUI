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

extension HomePage {
  private func topComponent() -> some View {
    HStack(spacing: 16) {
      Image("img_profile", bundle: .module)
        .resizable()
        .frame(width: 50, height: 50)
        .background(Color.blue)
        .clipShape(Circle())

      VStack(alignment: .leading, spacing: 8) {
        Text("Welcome back,")
          .font(.system(size: 12))
          .foregroundStyle(theme.colors.secondText)

        Text("Tanya Myroniuk")
          .font(.system(size: 18))
          .fontWeight(.medium)
          .foregroundStyle(theme.colors.primaryText)
      }

      Spacer()

      Button(action: { send(.onTapSearch) }) {
        Image(systemName: "magnifyingglass")
          .resizable()
          .frame(width: 20, height: 20)
          .foregroundColor(theme.colors.primaryText)
          .padding(12)
          .background(theme.colors.tabBackground)
          .clipShape(Circle())
      }
    }
  }

  private func buttonGroupComponent() -> some View {
    HStack {
      Button(action: { send(.onTapSent) }) {
        VStack(spacing: 8) {
          Image(systemName: "arrow.up")
            .foregroundStyle(theme.colors.primaryText)
            .padding(18)
            .background(theme.colors.tabBackground)
            .clipShape(Circle())
          Text("Sent")
            .font(.system(size: 13))
            .foregroundStyle(theme.colors.primaryText)
        }
      }
      Spacer()
      Button(action: { send(.onTapReceive) }) {
        VStack(spacing: 8) {
          Image(systemName: "arrow.down")
            .foregroundStyle(theme.colors.primaryText)
            .padding(18)
            .background(theme.colors.tabBackground)
            .clipShape(Circle())
          Text("Receive")
            .font(.system(size: 13))
            .foregroundStyle(theme.colors.primaryText)
        }
      }
      Spacer()
      Button(action: { send(.onTapLoan) }) {
        VStack(spacing: 8) {
          Image(systemName: "s.circle")
            .foregroundStyle(theme.colors.primaryText)
            .padding(18)
            .background(theme.colors.tabBackground)
            .clipShape(Circle())
          Text("Loan")
            .font(.system(size: 13))
            .foregroundStyle(theme.colors.primaryText)
        }
      }
      Spacer()
      Button(action: { send(.onTapTopup) }) {
        VStack(spacing: 8) {
          Image(systemName: "square.and.arrow.up")
            .foregroundStyle(theme.colors.primaryText)
            .padding(18)
            .background(theme.colors.tabBackground)
            .clipShape(Circle())
          Text("Topup")
            .font(.system(size: 13))
            .foregroundStyle(theme.colors.primaryText)
        }
      }
    }
  }

  private func transactionComponent() -> some View {
    VStack(spacing: 18) {
      HStack {
        Text("Transaction")
          .font(.system(size: 18))
          .fontWeight(.medium)
          .foregroundStyle(theme.colors.primaryText)
        Spacer()
        Button(action: { send(.onTapSellAll) }) {
          Text("Sell All")
            .font(.system(size: 14))
            .fontWeight(.medium)
            .foregroundStyle(theme.colors.primary)
        }
      }

      LazyVStack {
        ForEach([TransactionItem.ViewState].mock) { item in
          TransactionItem(viewState: item)
        }
      }
    }
  }
}

extension HomePage: View {
  public var body: some View {
    ScrollView(.vertical) {
      VStack(spacing: 32) {
        topComponent()
        CardComponent(viewState: .mock)
        buttonGroupComponent()
        transactionComponent()
          .padding(.bottom, 20)
      }
      .padding(20)
    }
    .background(theme.colors.background)
  }
}
