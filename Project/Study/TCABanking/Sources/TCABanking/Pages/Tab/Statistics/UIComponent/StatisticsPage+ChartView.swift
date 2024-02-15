import SwiftUI
import Charts

extension StatisticsPage {
  public struct ChartView {

    @Environment(\.theme)
    private var theme
    private let charts: [ViewState] = .mock
    public var tapAmount: ((Int) -> Void)?
  }
}

extension StatisticsPage.ChartView {
  public struct ViewState: Identifiable, Equatable {
    public var id: Int { month }
    let amount: Int
    let month: Int
  }
}

extension [StatisticsPage.ChartView.ViewState] {
  fileprivate static var mock: Self {
    [
      .init(amount: 300, month: 1),
      .init(amount: 400, month: 2),
      .init(amount: 100, month: 3),
      .init(amount: 1000, month: 4),
      .init(amount: 200, month: 5),
    ]
  }
}


extension StatisticsPage.ChartView: View {
  public var body: some View {
    Chart(charts) { data in
      Plot {
        LineMark(
          x: PlottableValue.value("month", data.month),
          y: PlottableValue.value("amount", data.amount)
        )
        .lineStyle(.init(lineWidth: 5))
        .interpolationMethod(.catmullRom)
        .symbol(by: .value("Amount", "Fixed"))
        .symbolSize(100)
      }
    }
  }
}
