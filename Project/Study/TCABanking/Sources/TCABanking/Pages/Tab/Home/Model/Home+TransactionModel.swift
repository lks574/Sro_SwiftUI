import Foundation

extension HomePage {
  public struct TransactionModel: Equatable, Identifiable {
    public var id: Int
    public var imageURL: String
    public var title: String
    public var category: String
    public var amount: String
  }
}

extension [HomePage.TransactionModel] {
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
