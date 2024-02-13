import SwiftUI

public struct CustomSlider {

  @Binding public var ratio: Double
  public let viewState: ViewState

  public init(
    ratio: Binding<Double>,
    viewState: ViewState)
  {
    self._ratio = ratio
    self.viewState = viewState
  }
}

extension CustomSlider {
  public struct ViewState {
    public let min: Double
    public let max: Double
  }
}

extension CustomSlider {
  private func setRatio(x: CGFloat, width: CGFloat) {
    let ratio = x / width
    if ratio >= 0 && ratio <= 1 {
      self.ratio = ratio
    }
  }
}

extension CustomSlider: View {
  public var body: some View {
    GeometryReader { proxy in
      ZStack(alignment: .leading) {
        Rectangle()
          .fill(Color.black.opacity(0.2))
          .frame(height: 6)

        Rectangle()
          .fill(Color.black)
          .frame(width: ratio * proxy.size.width, height: 6)

        Circle()
          .fill(Color.black)
          .frame(width: 18, height: 18)
          .offset(x: ratio * proxy.size.width)
          .gesture(
            DragGesture()
              .onChanged {
                setRatio(x: $0.location.x, width: proxy.size.width)
              }
          )
      }
      .onTapGesture {
        setRatio(x: $0.x, width: proxy.size.width)
      }
    }
  }
}
