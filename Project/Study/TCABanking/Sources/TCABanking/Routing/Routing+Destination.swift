import Foundation
import ComposableArchitecture

extension Routing {

  @CasePathable
  public enum Destination {
    case onBoarding
    case signIn
    case signUp
  }
}

