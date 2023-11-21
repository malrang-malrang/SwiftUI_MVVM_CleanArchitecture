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
  private var cancellable: Set<AnyCancellable> = []
  var destination: AppDestination
  var isRoot: Bool

  @Published var navigationTrigger = false

  init(destination: AppDestination = .luanch, isRoot: Bool = false) {
    self.destination = destination
    self.isRoot = isRoot

    if isRoot {
      NotificationCenter.default.publisher(for: self.popToRootViewTriggerName)
        .sink { [unowned self] _ in
          self.navigationTrigger = false
        }
        .store(in: &cancellable)
    }
  }

  @ViewBuilder
  func composeView() -> some View {
    switch self.destination {
    case .luanch:
      let viewModel = LuanchViewMoel()
      LuanchView(viewModel: viewModel)
    case .main(let destination):
      let coordinator = MainCoordinator(parent: self, destination: destination, isRoot: true)
      coordinator.composeView()
    }
  }
}
