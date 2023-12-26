//
//  BookMarkView.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/7/23.
//

import SwiftUI

struct BookMarkView: View {
  @ObservedObject var appState: AppStorageService
  @ObservedObject var coordinator: BookMarkCoordinator

  @State var isSignInVisible: Bool

  init(appState: AppStorageService, coordinator: BookMarkCoordinator) {
    self.appState = appState
    self.coordinator = coordinator
    self._isSignInVisible = State(initialValue: !AppStorageService.shared.isSign)
  }

  var body: some View {
    NavigationView {
      ZStack {
        self.coordinator.navigationLinkSection()
        self.contensView()
          .fullScreenCover(isPresented: self.appState.$isSign) {
            self.coordinator.signInView(isVisible: self.$isSignInVisible)
          }
      }
    }
  }

  @ViewBuilder
  private func contensView() -> some View {
    Text("BookMark")
  }
}

#Preview {
  BookMarkView(
    appState: AppStorageService.shared,
    coordinator: BookMarkCoordinator(
      dependencyContainer: DefaultDependencyContainer(),
      parent: nil,
      destination: .root,
      isRoot: true
    )
  )
}
