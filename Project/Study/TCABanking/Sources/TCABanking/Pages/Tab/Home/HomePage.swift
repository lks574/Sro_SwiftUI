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

  private func cardComponent() -> some View {
    VStack(alignment: .leading, spacing: 28) {
      HStack {
        Image(systemName: "memorychip")
          .foregroundStyle(Color(hex: "#A2A2A7"))
        Spacer()
        Image(systemName: "wave.3.right")
          .foregroundStyle(Color(hex: "#A2A2A7"))
      }
      HStack(spacing: 8) {
        Text("4562")
          .font(.system(size: 24))
          .foregroundStyle(Color.white)
        Spacer()
        Text("1122")
          .font(.system(size: 24))
          .foregroundStyle(Color.white)
        Spacer()
        Text("4595")
          .font(.system(size: 24))
          .foregroundStyle(Color.white)
        Spacer()
        Text("7852")
          .font(.system(size: 24))
          .foregroundStyle(Color.white)
      }
      .padding(.horizontal, 4)

      Text("AR Jonson")
        .font(.system(size: 13))
        .foregroundStyle(Color.white)

      HStack(spacing: 8) {
        VStack(alignment: .leading, spacing: 8) {
          Text("Expiry Date")
            .font(.system(size: 9))
            .foregroundStyle(Color(hex: "#A2A2A7"))
          Text("24/2000")
            .font(.system(size: 13))
            .foregroundStyle(Color.white)
        }
        VStack(alignment: .leading, spacing: 8) {
          Text("CVV")
            .font(.system(size: 9))
            .foregroundStyle(Color(hex: "#A2A2A7"))
          Text("6986")
            .font(.system(size: 13))
            .foregroundStyle(Color.white)
        }
        Spacer()
        Text("MasterCard")
          .font(.system(size: 13))
          .foregroundStyle(Color.white)
      }
    }
    .padding(20)
    .background(Color(hex: "#25253D"))
    .overlay {
      Image("worldmap_card", bundle: .module)
    }
    .clipShape(RoundedRectangle(cornerRadius: 25))
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
        ForEach(store.transactionList, id: \.id) { item in
          HStack(spacing: 16) {
            Image(item.imageURL, bundle: .module)
              .frame(width: 42, height: 42)
              .foregroundStyle(theme.colors.primaryText)
              .background(theme.colors.tabBackground)
              .clipShape(Circle())
            VStack(alignment: .leading, spacing: .zero) {
              Text(item.title)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundStyle(theme.colors.primaryText)
              Text(item.category)
                .font(.system(size: 12))
                .foregroundStyle(theme.colors.secondText)
            }
            Spacer()
            Text(item.amount)
              .font(.system(size: 16))
              .fontWeight(.medium)
              .foregroundStyle(theme.colors.primaryText)
          }
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
        cardComponent()
        buttonGroupComponent()
        transactionComponent()
          .padding(.bottom, 20)
      }
      .padding(20)
    }
    .background(theme.colors.background)
  }
}
