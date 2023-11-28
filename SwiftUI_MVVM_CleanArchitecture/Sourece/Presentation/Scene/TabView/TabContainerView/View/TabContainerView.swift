//
//  TabContainerView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import SwiftUI

struct TabContainerView: View {
  @EnvironmentObject var coordinator: TabCoordinator
  @ObservedObject var viewModel: TabContainerViewModel

  init(viewModel: TabContainerViewModel) {
    self.viewModel = viewModel

    self.setTabBarAppearence()
    self.setNavigationBarAppearence()
  }

  var body: some View {
    NavigationView {
      ZStack {
        if !self.viewModel.state.luanchTaskCompleted {
          self.coordinator.luanchScreen(
            isTaskCompleted: self.$viewModel.state.luanchTaskCompleted
          )
          .zIndex(2)
          .transition(.opacity.animation(.easeOut(duration: 1.5)))
        }

        self.tabView().zIndex(1)

        self.coordinator.navigationLinkSection().zIndex(0)
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

fileprivate extension TabContainerView {
  private func setTabBarAppearence() {
    let tabBarAppearance = UITabBar.appearance()
    tabBarAppearance.backgroundColor = UIColor(.white)
    tabBarAppearance.shadowImage = UIImage()
  }

  private func setNavigationBarAppearence() {
    let navigationBarAppearance = UINavigationBarAppearance()
    navigationBarAppearance.backgroundColor = UIColor(.white)
    navigationBarAppearance.shadowColor = .clear
    UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    UINavigationBar.appearance().compactAppearance = navigationBarAppearance
  }
}

#Preview { TabContainerView(viewModel: TabContainerViewModel()) }
