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

        self.coordinator.luanchScreen().zIndex(2)

        self.tabView().zIndex(1)
      }
    }
  }

  private func tabView() -> some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

#Preview { TabContainerView() }
