//
//  TabContainerView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import SwiftUI

final class TabContainerViewModel: ViewModelable {
  enum Action {

  }

  struct State {
    var luanchTaskCompleted = false
  }

  @Published var state = State()

  func action(_ action: Action) {
//    switch action {
//    case .onLuanchScreen:
//      self.luanchAnimation()
//    }
  }
}

struct TabContainerView: View {
  @EnvironmentObject var coordinator: TabCoordinator

  init() {
    let tabBarAppearance = UITabBar.appearance()
    tabBarAppearance.backgroundColor = UIColor(.white)
    tabBarAppearance.shadowImage = UIImage()

    let navigationBarAppearance = UINavigationBarAppearance()
    navigationBarAppearance.backgroundColor = UIColor(.white)
    navigationBarAppearance.shadowColor = .clear
    UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    UINavigationBar.appearance().compactAppearance = navigationBarAppearance
  }

  var body: some View {
    NavigationView {
      ZStack {
        self.coordinator.navigationLinkSection().zIndex(0)

//        self.coordinator.luanchScreen().zIndex(2)

        self.tabView().zIndex(1)
      }
    }
  }

  private func tabView() -> some View {
    TabView(selection: $coordinator.destination) {

      self.coordinator.tabView(destination: .category)
      self.coordinator.tabView(destination: .bookmark)
      self.coordinator.tabView(destination: .home)
      self.coordinator.tabView(destination: .shoppingBasket)
      self.coordinator.tabView(destination: .myProfile)
    }
    .accentColor(ColorPalette.Indigo.indigo2)
  }
}

#Preview { TabContainerView() }
