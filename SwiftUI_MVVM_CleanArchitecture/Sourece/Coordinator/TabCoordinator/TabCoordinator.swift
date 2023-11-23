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
  private weak var dependencyContainer: DependencyContainer?
  private weak var parent: AppCoordinator?
  var cancellable: Set<AnyCancellable> = []
  var isRoot: Bool

  @Published var destination: TabDestination
  @Published var navigationTrigger = false

  init(
    dependencyContainer: DependencyContainer?,
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

extension TabCoordinator {
  @ViewBuilder
  func luanchScreen() -> some View {
    let viewModel = LuanchViewMoel()
    LuanchView(viewModel: viewModel)
  }

  @ViewBuilder
  func categoryView() -> some View {
    CategoryView()
  }

  @ViewBuilder
  func bookmarkView() -> some View {
    BookMarkView()
  }

  @ViewBuilder
  func homeView() -> some View {
    HomeView()
  }

  @ViewBuilder
  func shoppingBasketView() -> some View {
    ShoppingBasketView()
  }
}
