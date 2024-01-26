import Foundation
import ComposableArchitecture
import SwiftUI

extension Routing {
  public struct Builder { }
}

extension Routing.Builder {

  public static func splash() -> SplashPage {
    .init(
      store: .init(
        initialState: SplashStore.State(),
        reducer: {
          SplashStore()
        })
    )
  }

  public static func onBoarding() -> OnBoardingPage {
    .init(
      store: .init(
        initialState: OnBoardingStore.State(),
        reducer: {
          OnBoardingStore()
        })
    )
  }

  public static func signIn() -> SignInPage {
    .init(
      store: .init(
        initialState: SignInStore.State(),
        reducer: {
          SignInStore()
        })
    )
  }

  public static func signUp() -> SignUpPage {
    .init(
      store: .init(
        initialState: SignUpStore.State(),
        reducer: {
          SignUpStore()
        })
    )
  }
}
