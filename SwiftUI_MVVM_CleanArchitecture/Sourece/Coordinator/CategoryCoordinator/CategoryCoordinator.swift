//
//  CategoryCoordinator.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/10/23.
//

import SwiftUI
import Combine

final class CategoryCoordinator: Coordinator, ConvertibleToSignIn {
  private(set) var popToRootViewTriggerName = Notification.Name(rawValue: "PopToCategoryRoot")
  private(set) weak var dependencyContainer: DependencyContainer?
  private(set) weak var parent: (any Coordinator)?
  var cancellable: Set<AnyCancellable> = []
  var isRoot: Bool

  @Published var destination: CategoryDestination
  @Published var navigationTrigger = false

  init(
    dependencyContainer: DependencyContainer?,
    parent: (any Coordinator)?,
    destination: CategoryDestination,
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
    switch self.destination {
    case .root:
      self.categoryView()
    case .setting:
      self.settingView()
    }
  }
}

extension CategoryCoordinator {
  @ViewBuilder
  func categoryView() -> some View {
    let viewModel = CategoryViewModel()
    CategoryView(coordinator: self, viewModel: viewModel)
      .environmentObject(AppStorageService.shared)
  }

  @ViewBuilder
  func settingView() -> some View {
    let coordinator = CategoryCoordinator(
      dependencyContainer: self.dependencyContainer,
      parent: self,
      destination: .setting
    )
    SettingView(coordinator: coordinator)
      .environmentObject(AppStorageService.shared)
      .navigationBarBackButtonImage(ImageCollecteion.Chevrone.left)
      .navigationBarTitle(Constant.setting, displayMode: .inline)
  }
}

private enum Constant {
  static var setting: String { "설정" }
}
