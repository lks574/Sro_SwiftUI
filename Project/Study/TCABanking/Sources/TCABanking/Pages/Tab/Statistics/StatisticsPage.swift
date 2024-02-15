import SwiftUI
import SwiftUINavigation
import ComposableArchitecture
import Charts

@ViewAction(for: StatisticsStore.self)
public struct StatisticsPage {
  @Bindable
  public var store: StoreOf<StatisticsStore>

  @Environment(\.theme)
  private var theme

  public init(store: StoreOf<StatisticsStore>) {
    self.store = store
  }
}

extension StatisticsPage {
  private func chartComponent() -> some View {
    VStack(spacing: 30) {
      VStack(spacing: 12) {
        Text("Current Balance")
          .foregroundStyle(theme.colors.secondText)
          .font(.system(size: 18))
        Text("$\(NumericFunctor.formatterDecimal(number: store.amount) ?? "0")")
          .foregroundStyle(theme.colors.primaryText)
          .font(.system(size: 26, weight: .medium))
        ChartView(
          tapAmount: {
            send(.onTapChartAmount($0))
          }
        )
      }
    }
  }
}

extension StatisticsPage: View {
  public var body: some View {
    ScrollView(.vertical) {
      VStack {
        chartComponent()
      }
      .padding(.vertical, 30)
      .padding(.horizontal, 20)
    }
  }
}
