import Foundation
import SwiftUI

struct Theme {
  let colors = Colors()

  struct Colors {
    let background = Color("background", bundle: .module)
    let primary = Color("primary", bundle: .module)
    let primaryText = Color("primaryText", bundle: .module)
    let secondText = Color("secondText", bundle: .module)
    let separator = Color("separator", bundle: .module)
    let tabBackground = Color("tabBackground", bundle: .module)
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
