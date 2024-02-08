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

extension MyCardPage {
  private func transactionComponent() -> some View {
    LazyVStack {
      ForEach([TransactionItem.ViewState].mock.filter { $0.isSpend }) { item in
        TransactionItem(viewState: item)
      }
    }
  }

  private func limitComponent() -> some View {
    VStack(spacing: 18) {
      HStack {
        Text("Monthly spending limit")
          .font(.system(size: 18))
          .fontWeight(.medium)
          .foregroundStyle(theme.colors.primaryText)
        Spacer()
      }
      VStack(alignment: .leading, spacing: 12) {
        Text("Amount: $\(NumericFunctor.formatterDecimal(number: store.amount) ?? "0")")
          .font(.system(size: 13))
          .foregroundStyle(theme.colors.primaryText)

        Slider(
          value: $store.spendSlider,
          in: 0...store.maxLimit,
          onEditingChanged: { isEditing in
            print("isEditing", isEditing)
          }
        )
        Text(NumericFunctor.formatterDecimal(number: store.spendSlider) ?? "0")
      }
      .padding(24)
      .background(theme.colors.tabBackground)
      .clipShape(RoundedRectangle(cornerRadius: 18))
    }
  }
}

extension MyCardPage: View {
  public var body: some View {
    ScrollView(.vertical) {
      VStack(spacing: 30) {
        CardComponent(viewState: .mock)
        transactionComponent()
        limitComponent()
      }
      .padding(20)
    }
    .background(theme.colors.background)
  }
}

#Preview {
  Routing.Builder.myCard()
}
