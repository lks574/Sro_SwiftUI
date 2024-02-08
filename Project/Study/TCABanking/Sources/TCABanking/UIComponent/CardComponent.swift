import SwiftUI

public struct CardComponent {
  public let viewState: ViewState
}

extension CardComponent {
  public struct ViewState: Equatable {
    public let cardNumbers: String
    public let name: String
    public let expiryDate: String
    public let cvv: String

    public var numbers: [CardNumber] {
      cardNumbers.components(separatedBy: " ")
        .enumerated()
        .map {
          CardNumber(index: $0.offset, number: $0.element)
        }
    }
  }

  public struct CardNumber: Identifiable, Equatable {
    public var id: Int { index }
    public var index: Int
    public var number: String
  }
}

extension CardComponent.ViewState {
  public static var mock: Self {
    .init(
      cardNumbers: "4562 1122 4595 7852",
      name: "AR Jonson",
      expiryDate: "24/2000",
      cvv: "6986")
  }
}

extension CardComponent: View {
  public var body: some View {
    VStack(alignment: .leading, spacing: 28) {
      HStack {
        Image(systemName: "memorychip")
          .foregroundStyle(Color(hex: "#A2A2A7"))
        Spacer()
        Image(systemName: "wave.3.right")
          .foregroundStyle(Color(hex: "#A2A2A7"))
      }
      HStack(spacing: 8) {
        ForEach(viewState.numbers) { numbers in
          HStack(spacing: .zero) {
            Text(numbers.number)
              .font(.system(size: 24))
              .foregroundStyle(Color.white)
            if viewState.numbers.last != numbers {
              Spacer()
            }
          }
        }
      }
      .padding(.horizontal, 4)

      Text(viewState.name)
        .font(.system(size: 13))
        .foregroundStyle(Color.white)

      HStack(spacing: 8) {
        VStack(alignment: .leading, spacing: 8) {
          Text("Expiry Date")
            .font(.system(size: 9))
            .foregroundStyle(Color(hex: "#A2A2A7"))
          Text(viewState.expiryDate)
            .font(.system(size: 13))
            .foregroundStyle(Color.white)
        }
        VStack(alignment: .leading, spacing: 8) {
          Text("CVV")
            .font(.system(size: 9))
            .foregroundStyle(Color(hex: "#A2A2A7"))
          Text(viewState.cvv)
            .font(.system(size: 13))
            .foregroundStyle(Color.white)
        }
        Spacer()
        Text("MasterCard")
          .font(.system(size: 13))
          .foregroundStyle(Color.white)
      }
    }
    .padding(20)
    .background(Color(hex: "#25253D"))
    .overlay {
      Image("worldmap_card", bundle: .module)
    }
    .clipShape(RoundedRectangle(cornerRadius: 25))
  }
}
