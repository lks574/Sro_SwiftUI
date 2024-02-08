import SwiftUI

public struct TransactionItem {
  @Environment(\.theme)
  private var theme

  public let viewState: ViewState
}

extension TransactionItem {
  public struct ViewState: Equatable, Identifiable {
    public var id: Int
    public var imageURL: String
    public var title: String
    public var category: String
    public var amount: String
  }
}

extension [TransactionItem.ViewState] {
  public static var mock: Self {
    [
      .init(
        id: .zero,
        imageURL: "logo_apple",
        title: "Apple Store",
        category: "Entertainment",
        amount: "- $5,99"),
      .init(
        id: 1,
        imageURL: "logo_spotify",
        title: "Spotify",
        category: "Music",
        amount: "- $12,99"),
      .init(
        id: 2,
        imageURL: "logo_transfer",
        title: "Money Transfer",
        category: "Transaction",
        amount: "$300"),
      .init(
        id: 3,
        imageURL: "logo_grocery",
        title: "Grocery",
        category: "Shopping",
        amount: "- $ 88"),
    ]
  }
}


extension TransactionItem: View {
  public var body: some View {
    HStack(spacing: 16) {
      Image(viewState.imageURL, bundle: .module)
        .frame(width: 42, height: 42)
        .foregroundStyle(theme.colors.primaryText)
        .background(theme.colors.tabBackground)
        .clipShape(Circle())
      VStack(alignment: .leading, spacing: .zero) {
        Text(viewState.title)
          .font(.system(size: 16))
          .fontWeight(.medium)
          .foregroundStyle(theme.colors.primaryText)
        Text(viewState.category)
          .font(.system(size: 12))
          .foregroundStyle(theme.colors.secondText)
      }
      Spacer()
      Text(viewState.amount)
        .font(.system(size: 16))
        .fontWeight(.medium)
        .foregroundStyle(theme.colors.primaryText)
    }
  }
}
