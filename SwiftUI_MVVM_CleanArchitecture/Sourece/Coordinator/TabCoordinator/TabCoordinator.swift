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
    let viewModel = TabContainerViewModel()
    TabContainerView(viewModel: viewModel)
      .environmentObject(self)
      .navigationBarHidden(true)
  }
}

extension TabCoordinator {
  @ViewBuilder
  func luanchScreen(isTaskCompleted: Binding<Bool>) -> some View {
    let ViewModel = LuanchViewMoel(isTaskCompleted: isTaskCompleted)
    LuanchView(viewModel: ViewModel)
  }

  @ViewBuilder
  func tabView(destination: TabDestination) -> some View {
    VStack {
      switch destination {
      case .category:
        CategoryView()
      case .bookmark:
        BookMarkView()
      case .home:
        HomeView()
      case .shoppingBasket:
        ShoppingBasketView()
      case .myProfile:
        MyProfileView()
      }
    }
    .tabItem {
      destination.tabBarItem
        .environment(
          \.symbolVariants,
           destination == self.destination ? .fill : .none
        )
    }
    .tag(destination)
  }
}
