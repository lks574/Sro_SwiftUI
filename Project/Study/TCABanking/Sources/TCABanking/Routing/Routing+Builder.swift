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

  public static func tab() -> BankingTabPage {
    .init(
      store: .init(
        initialState: BankingTabStore.State(),
        reducer: {
          BankingTabStore()
        })
    )
  }

  public static func home() -> HomePage {
    .init(
      store: .init(
        initialState: HomeStore.State(),
        reducer: {
          HomeStore()
        })
    )
  }

  public static func myCard() -> MyCardPage {
    .init(
      store: .init(
        initialState: MyCardStore.State(),
        reducer: {
          MyCardStore()
        })
    )
  }

  public static func statistics() -> StatisticsPage {
    .init(
      store: .init(
        initialState: StatisticsStore.State(),
        reducer: {
          StatisticsStore()
        })
    )
  }
}
