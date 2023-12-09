//
//  HomeCoordinator.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/5/23.
//

import SwiftUI
import Combine

final class HomeCoordinator: Coordinator {
  private(set) var popToRootViewTriggerName = Notification.Name(rawValue: "PopToHomeRoot")
  private weak var dependencyContainer: DependencyContainer?
  private weak var parent: TabCoordinator?
  var cancellable: Set<AnyCancellable> = []
  var isRoot: Bool

  @Published var destination: HomeDestination
  @Published var navigationTrigger = false

  init(
    dependencyContainer: DependencyContainer?,
    parent: TabCoordinator,
    destination: HomeDestination,
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
    let viewModel = HomeViewModel(
      isSign: AppStorageService.shared.$isSign,
      userInfo: AppStorageService.shared.$userInfo
    )
    HomeView(viewModel: viewModel)
      .environmentObject(self)
  }
}
