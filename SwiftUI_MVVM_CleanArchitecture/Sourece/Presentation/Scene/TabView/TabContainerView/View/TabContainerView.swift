//
//  TabContainerView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import SwiftUI

struct TabContainerView: View {
  @EnvironmentObject var coordinator: TabCoordinator

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

      self.coordinator.categoryView()
        .tabItem { TabDestination.category.tabBarItem }
        .tag(TabDestination.category)

      self.coordinator.bookmarkView()
        .tabItem { TabDestination.bookmark.tabBarItem }
        .tag(TabDestination.bookmark)

    }
  }
}

#Preview { TabContainerView() }
