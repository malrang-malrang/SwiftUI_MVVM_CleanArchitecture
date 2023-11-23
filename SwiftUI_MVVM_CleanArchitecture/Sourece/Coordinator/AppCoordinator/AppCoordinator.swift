//
//  AppCoordinator.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import SwiftUI
import Combine

final class AppCoordinator: Coordinator {
  private(set) var popToRootViewTriggerName = Notification.Name(rawValue: "PopToAppRoot")
  private unowned var dependencyContainer: DependencyContainer
  var cancellable: Set<AnyCancellable> = []
  var isRoot: Bool
  var destination: AppDestination

  @Published var navigationTrigger = false

  init(
    dependencyContainer: DependencyContainer,
    destination: AppDestination = .tab(.home),
    isRoot: Bool = true
  ) {
    self.dependencyContainer = dependencyContainer
    self.destination = destination
    self.isRoot = isRoot

    self.subscribeIsRoot()
  }

  @ViewBuilder
  func composeView() -> some View {
    switch self.destination {
    case .tab(let tabDestination):
      let coordinator = TabCoordinator(
        dependencyContainer: self.dependencyContainer,
        parent: self,
        destination: tabDestination
      )
      coordinator.composeView()
    }
  }
}
