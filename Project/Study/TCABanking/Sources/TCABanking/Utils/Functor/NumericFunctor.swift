import Foundation

public enum NumericFunctor { }

extension NumericFunctor {
  public static func formatterDecimal(number: Int?) -> String? {
    guard let number else { return .none }
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.decimalSeparator = ","
    return formatter.string(from: NSNumber(value: number))
  }

  public static func formatterDecimal(number: Double?) -> String? {
    guard let number else { return .none }
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(from: NSNumber(value: number))
  }
}
