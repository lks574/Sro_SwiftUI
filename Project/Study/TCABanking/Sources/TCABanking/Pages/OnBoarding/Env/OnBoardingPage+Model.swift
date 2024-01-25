import Foundation

extension OnBoardingPage {
  struct TabModel: Equatable, Identifiable {
    var id: Int { index }
    let index: Int
    let image: String
    let title: String
    let subTitle: String
  }
}

extension [OnBoardingPage.TabModel] {
  static var onBoardings: Self {
    [
      .init(
        index: 0,
        image: "OnBoarding1",
        title: "Fastest Payment in the world",
        subTitle: "Integrate multiple payment methoods to help you up the process quickly"),
      .init(
        index: 1,
        image: "OnBoarding2",
        title: "The most Secoure Platfrom for Customer",
        subTitle: "Built-in Fingerprint, face recognition and more, keeping you completely safe"),
      .init(
        index: 2,
        image: "OnBoarding3",
        title: "Paying for Everything is Easy and Convenient",
        subTitle: "Built-in Fingerprint, face recognition and more, keeping you completely safe"),
    ]
  }
}
