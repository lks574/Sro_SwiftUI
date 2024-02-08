import SwiftUI

public struct BankingSlider {

  @State private var width: CGFloat = .zero
  @State private var width1: CGFloat = 15
  public let viewState: ViewState
}

extension BankingSlider {
  public struct ViewState {

  }
}

extension BankingSlider: View {
  public var body: some View {
    ZStack(alignment: .leading) {
      Rectangle()
        .fill(Color.black.opacity(0.2))
        .frame(height: 6)

      Rectangle()
        .fill(Color.black)
        .frame(width:self.width, height: 6)

      HStack(spacing: .zero) {
        Circle()
          .fill(Color.black)
          .frame(width: 18, height: 18)
          .offset(x: self.width)
          .gesture(
            DragGesture()
              .onChanged { value in

              }
          )

        Circle()
          .fill(Color.black)
          .frame(width: 18, height: 18)
          .offset(x: self.width1)
      }
    }
  }
}

#Preview {
  BankingSlider(viewState: .init())
}
