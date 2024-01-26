import Foundation
import SwiftUI

struct Theme {
  let colors = Colors()

  struct Colors {
    let background = Color("background")
    let primary = Color("primary")
    let primaryText = Color("primaryText")
    let secondText = Color("secondText")
    let separator = Color("separator")
  }
}

extension Theme {
  static let `default` = Self()
}

private struct ThemeEnvironmentKey: EnvironmentKey {
  static var defaultValue = Theme.default
}

extension EnvironmentValues {
  var theme: Theme {
    get { self[ThemeEnvironmentKey.self] }
    set { self[ThemeEnvironmentKey.self] = newValue }
  }
}
