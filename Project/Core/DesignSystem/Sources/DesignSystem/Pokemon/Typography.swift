import Foundation
import SwiftUI

public enum PokemonFont {
  public enum Header {
    public static let headline: Font = .system(size: 24, weight: .bold)
    public static let subtitle3: Font = .system(size: 10, weight: .bold)
    public static let subtitle2: Font = .system(size: 12, weight: .bold)
    public static let subtitle1: Font = .system(size: 14, weight: .bold)
  }

  public enum Body {
    public static let body3: Font = .system(size: 10, weight: .regular)
    public static let body2: Font = .system(size: 12, weight: .regular)
    public static let body1: Font = .system(size: 14, weight: .regular)
    public static let caption: Font = .system(size: 8, weight: .regular)
  }
}
