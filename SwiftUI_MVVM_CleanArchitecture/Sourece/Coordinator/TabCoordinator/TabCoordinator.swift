//
//  TabCoordinator.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import SwiftUI
import Combine

final class TabCoordinator: Coordinator {
  private(set) var popToRootViewTriggerName = Notification.Name(rawValue: "PopToTabRoot")
  private unowned var dependencyContainer: DependencyContainer
  private unowned var parent: AppCoordinator
  var cancellable: Set<AnyCancellable> = []
  var isRoot: Bool

  @Published var destination: TabDestination
  @Published var navigationTrigger = false

  init(
    dependencyContainer: DependencyContainer,
    parent: AppCoordinator,
    destination: TabDestination,
    isRoot: Bool = true
  ) {
    self.dependencyContainer = dependencyContainer
    self.parent = parent
    self.destination = destination
    self.isRoot = isRoot

    self.subscribeIsRoot()
  }

  @ViewBuilder
  func composeView() -> some View {
    TabContainerView()
      .environmentObject(self)
      .navigationBarHidden(true)
  }
}
