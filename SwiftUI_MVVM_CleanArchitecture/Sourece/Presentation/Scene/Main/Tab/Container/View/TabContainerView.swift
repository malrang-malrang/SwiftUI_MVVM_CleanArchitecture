//
//  TabContainerView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import SwiftUI

struct TabContainerView: View {
  @EnvironmentObject var coordinator: TabCoordinator
  @StateObject var viewModel: LuanchViewMoel

  var body: some View {
    NavigationView {
      ZStack {
        self.coordinator.navigationLinkSection()

        self.tabView()
      }
    }
  }

  private func tabView() -> some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

#Preview { TabContainerView(viewModel: LuanchViewMoel()) }
