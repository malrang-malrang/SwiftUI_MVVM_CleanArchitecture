//
//  TabContainerView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import SwiftUI

struct TabContainerView: View {
  @StateObject var coordinator: TabCoordinator
  @StateObject var viewModel: TabContainerViewModel

  var body: some View {
    NavigationView {
      ZStack {
        self.coordinator.navigationLinkSection().zIndex(0)
        self.contentsView().zIndex(1)

        if !self.viewModel.state.luanchTaskCompleted {
          self.coordinator.luanchScreen(isTaskCompleted: self.$viewModel.state.luanchTaskCompleted)
          .transition(.opacity.animation(.easeOut(duration: 1.5)))
          .zIndex(2)
        }
      }
    }
  }

  private func contentsView() -> some View {
    TabView(selection: $coordinator.destination) {
//      self.coordinator.categoryView()
//        .tabItem {
//          TabDestination.category.tabBarItem
//          //          .environment(
//          //            \.symbolVariants,
//          //             destination == self.destination ? .fill : .none
//          //          )
//        }
//      .tag(self.coordinator.destination)
//
//      self.coordinator.bookmarkView()
//
//      self.coordinator.homeView()
//
//      self.coordinator.shoppingBasketView()
//
//      self.coordinator.myProfileView()

      self.coordinator.tabView(destination: .category)
      self.coordinator.tabView(destination: .bookmark)
      self.coordinator.tabView(destination: .home)
      self.coordinator.tabView(destination: .shoppingBasket)
      self.coordinator.tabView(destination: .myProfile)
    }
    .accentColor(ColorPalette.Indigo.indigo2)
  }
}

#Preview {
  TabContainerView(
    coordinator: TabCoordinator(
      dependencyContainer: DefaultDependencyContainer(),
      parent: nil,
      destination: .home,
      isRoot: true
    ),
    viewModel: TabContainerViewModel()
  )
}
