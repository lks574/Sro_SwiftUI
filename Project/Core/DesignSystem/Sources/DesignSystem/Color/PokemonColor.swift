import Foundation
import UIKit
import SwiftUI

public protocol ColorType {
  static var dark: UIColor { get }
  static var light: UIColor { get }
}

extension ColorType {
  public static var Color: Color {
    .init(getColor())
  }

  public static func getColor() -> UIColor {
    UIColor {
      switch $0.userInterfaceStyle {
      case .dark: return dark
      default: return light
      }
    }
  }
}

extension UIColor {
  public func convertColor() -> Color {
    .init(self)
  }
}

public enum PokemonColor {
  public enum Identity {
    public struct Primary: ColorType {
      public static let dark: UIColor = .init(hex: "#DC0A2D")
      public static var light: UIColor = .init(hex: "#DC0A2D")
    }
  }

  public enum PokemonType {
    public struct Bug: ColorType {
      public static let dark: UIColor = .init(hex: "#A7B723")
      public static var light: UIColor = .init(hex: "#A7B723")
    }

    public struct Dark: ColorType {
      public static let dark: UIColor = .init(hex: "#75574C")
      public static var light: UIColor = .init(hex: "#75574C")
    }

    public struct Dragon: ColorType {
      public static let dark: UIColor = .init(hex: "#7037FF")
      public static var light: UIColor = .init(hex: "#7037FF")
    }

    public struct Electric: ColorType {
      public static let dark: UIColor = .init(hex: "#F9CF30")
      public static var light: UIColor = .init(hex: "#F9CF30")
    }

    public struct Fairy: ColorType {
      public static let dark: UIColor = .init(hex: "#E69EAC")
      public static var light: UIColor = .init(hex: "#E69EAC")
    }

    public struct Fighting: ColorType {
      public static let dark: UIColor = .init(hex: "#C12239")
      public static var light: UIColor = .init(hex: "#C12239")
    }

    public struct Fire: ColorType {
      public static let dark: UIColor = .init(hex: "#F57D31")
      public static var light: UIColor = .init(hex: "#F57D31")
    }

    public struct Flying: ColorType {
      public static let dark: UIColor = .init(hex: "#A891EC")
      public static var light: UIColor = .init(hex: "#A891EC")
    }

    public struct Ghost: ColorType {
      public static let dark: UIColor = .init(hex: "#70559B")
      public static var light: UIColor = .init(hex: "#70559B")
    }

    public struct Normal: ColorType {
      public static let dark: UIColor = .init(hex: "#AAA67F")
      public static var light: UIColor = .init(hex: "#AAA67F")
    }

    public struct Grass: ColorType {
      public static let dark: UIColor = .init(hex: "#74CB48")
      public static var light: UIColor = .init(hex: "#74CB48")
    }

    public struct Ground: ColorType {
      public static let dark: UIColor = .init(hex: "#DEC16B")
      public static var light: UIColor = .init(hex: "#DEC16B")
    }

    public struct Ice: ColorType {
      public static let dark: UIColor = .init(hex: "#9AD6DF")
      public static var light: UIColor = .init(hex: "#9AD6DF")
    }

    public struct Poison: ColorType {
      public static let dark: UIColor = .init(hex: "#A43E9E")
      public static var light: UIColor = .init(hex: "#A43E9E")
    }

    public struct Psychic: ColorType {
      public static let dark: UIColor = .init(hex: "#FB5584")
      public static var light: UIColor = .init(hex: "#FB5584")
    }

    public struct Rock: ColorType {
      public static let dark: UIColor = .init(hex: "#B69E31")
      public static var light: UIColor = .init(hex: "#B69E31")
    }

    public struct Steel: ColorType {
      public static let dark: UIColor = .init(hex: "#B7B9D0")
      public static var light: UIColor = .init(hex: "#B7B9D0")
    }

    public struct Water: ColorType {
      public static let dark: UIColor = .init(hex: "#6493EB")
      public static var light: UIColor = .init(hex: "#6493EB")
    }
  }

  public enum Grayscale {
    public struct Dark: ColorType {
      public static let dark: UIColor = .init(hex: "#212121")
      public static var light: UIColor = .init(hex: "#212121")
    }
    public struct Medium: ColorType {
      public static let dark: UIColor = .init(hex: "#666666")
      public static var light: UIColor = .init(hex: "#666666")
    }
    public struct Light: ColorType {
      public static let dark: UIColor = .init(hex: "#E0E0E0")
      public static var light: UIColor = .init(hex: "#E0E0E0")
    }
    public struct Background: ColorType {
      public static let dark: UIColor = .init(hex: "#EFEFEF")
      public static var light: UIColor = .init(hex: "#EFEFEF")
    }
    public struct White: ColorType {
      public static let dark: UIColor = .init(hex: "#FFFFFF")
      public static var light: UIColor = .init(hex: "#FFFFFF")
    }

  }
}


extension UIColor {
  public convenience init(hex: UInt, alpha: Double = 1) {
    self.init(
      red: CGFloat((hex >> 16) & 0xff) / 255,
      green: CGFloat((hex >> 08) & 0xff) / 255,
      blue: CGFloat((hex >> 00) & 0xff) / 255,
      alpha: alpha)
  }

  public convenience init(hex: String, alpha: Double = 1) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")

    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)

    self.init(
      red: CGFloat((rgb >> 16) & 0xFF) / 255.0,
      green: CGFloat((rgb >> 8) & 0xFF) / 255.0,
      blue: CGFloat((rgb >> 0) & 0xFF) / 255.0,
      alpha: alpha)
  }
}
