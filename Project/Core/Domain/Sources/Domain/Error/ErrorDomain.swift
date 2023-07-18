import Foundation

public enum ErrorDomain: Error {
  case invalidTypeCasting
  case timeout
  case networkOffline
  case networkUnauthorized
  case networkUnknown
  case other(Error)
  case userCancelled
}

extension ErrorDomain: Equatable {
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.localizedDescription == rhs.localizedDescription
  }
}
