import Foundation
import SwiftUI

// MARK: - CustomDialog

struct CustomDialog<DialogContent: View>: ViewModifier {

  // MARK: Lifecycle

  public init(
    isPresented: Binding<Bool>,
    cornerRadius: CGFloat,
    @ViewBuilder dialogContent: @escaping () -> DialogContent)
  {
    _isPresented = isPresented
    self.cornerRadius = cornerRadius
    self.dialogContent = dialogContent()
  }

  // MARK: Internal

  @Binding var isPresented: Bool
  let cornerRadius: CGFloat
  let dialogContent: DialogContent

  func body(content: Content) -> some View {
    ZStack {
      content

      ZStack {
        if isPresented {
          Rectangle()
            .ignoresSafeArea()
            .foregroundColor(Color.black.opacity(0.2))
            .transition(
              .asymmetric(
                insertion: .opacity,
                removal: .opacity)
                .animation(.easeOut(duration: 0.15)))

          Group {
            dialogContent
              .frame(
                maxWidth: min(UIScreen.main.bounds.width * 0.8, 400))
              .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
              .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 6)
          }
          .transition(
            .asymmetric(
              insertion: .opacity,
              removal: .opacity)
              .animation(.easeOut(duration: 0.15)))
        }
      }
      .animation(.easeInOut, value: isPresented)
    }
  }
}

extension View {
  public func customDialog(
    isPresented: Binding<Bool>,
    cornerRadius: CGFloat,
    @ViewBuilder dialogContent: @escaping () -> some View)
    -> some View
  {
    modifier(
      CustomDialog(
        isPresented: isPresented,
        cornerRadius: cornerRadius,
        dialogContent: dialogContent))
  }
}
