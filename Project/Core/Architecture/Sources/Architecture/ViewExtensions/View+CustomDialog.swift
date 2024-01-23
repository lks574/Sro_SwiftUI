import CasePaths
import SwiftUI
import DesignSystem

extension View {
  public func customDialog<Value>(
    unwrapping value: Binding<Value?>,
    cornerRadius: CGFloat,
    @ViewBuilder content: @escaping (Binding<Value>) -> some View)
    -> some View
  {
    customDialog(
      isPresented: value.isPresent(),
      cornerRadius: cornerRadius)
    {
      Binding(wrapping: value).map(content)
    }
  }

  public func customDialog<Enum, Case>(
    unwrapping enum: Binding<Enum?>,
    case casePath: AnyCasePath<Enum, Case>,
    cornerRadius: CGFloat,
    @ViewBuilder content: @escaping (Binding<Case>) -> some View)
    -> some View
  {
    customDialog(
      unwrapping: `enum`.case(casePath),
      cornerRadius: cornerRadius,
      content: content)
  }
}
