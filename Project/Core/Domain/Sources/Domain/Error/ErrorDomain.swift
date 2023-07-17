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
