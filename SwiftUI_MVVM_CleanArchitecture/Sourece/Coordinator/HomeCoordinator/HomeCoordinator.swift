//
//  HomeCoordinator.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/5/23.
//

import SwiftUI
import Combine

final class HomeCoordinator: Coordinator, ConvertibleToSignIn {
  private(set) var popToRootViewTriggerName = Notification.Name(rawValue: "PopToHomeRoot")
  private(set) weak var dependencyContainer: DependencyContainer?
  private(set) weak var parent: (any Coordinator)?
  var cancellable: Set<AnyCancellable> = []
  var isRoot: Bool

  @Published var destination: HomeDestination
  @Published var navigationTrigger = false

  init(
    dependencyContainer: DependencyContainer?,
    parent: (any Coordinator)?,
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
    let viewModel = HomeViewModel()
    HomeView(coordinator: self, viewModel: viewModel)
      .environmentObject(AppStorageService.shared)
  }
}
