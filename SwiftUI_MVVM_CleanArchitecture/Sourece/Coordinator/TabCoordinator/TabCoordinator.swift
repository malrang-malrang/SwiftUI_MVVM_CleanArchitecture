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
  private(set) weak var dependencyContainer: DependencyContainer?
  private(set) weak var parent: (any Coordinator)?
  var cancellable: Set<AnyCancellable> = []
  var isRoot: Bool

  @Published var destination: TabDestination
  @Published var navigationTrigger = false

  init(
    dependencyContainer: DependencyContainer?,
    parent: (any Coordinator)?,
    destination: TabDestination,
    isRoot: Bool = true
  ) {
    self.dependencyContainer = dependencyContainer
    self.parent = parent
    self.destination = destination
    self.isRoot = isRoot

    self.subscribeIsRoot()
    self.setTabBarAppearence()
    self.setNavigationBarAppearence()
    self.setScrollView()
  }

  @ViewBuilder
  func composeView() -> some View {
    let viewModel = TabContainerViewModel()
    TabContainerView(coordinator: self, viewModel: viewModel)
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
  func categoryView() -> some View {
    let coordinator = CategoryCoordinator(
      dependencyContainer: self.dependencyContainer,
      parent: self,
      destination: .root
    )
    coordinator.composeView()
  }

  @ViewBuilder
  func bookmarkView() -> some View {
    let coordinator = BookMarkCoordinator(
      dependencyContainer: self.dependencyContainer,
      parent: self,
      destination: .root
    )
    coordinator.composeView()
  }

  @ViewBuilder
  func homeView() -> some View {
    let coordinator = HomeCoordinator(
      dependencyContainer: self.dependencyContainer,
      parent: self,
      destination: .root
    )
    coordinator.composeView()
  }

  @ViewBuilder
  func shoppingBasketView() -> some View {
    ShoppingBasketView()
  }

  @ViewBuilder
  func myProfileView() -> some View {
    MyProfileView()
  }

  @ViewBuilder
  func tabView(destination: TabDestination) -> some View {
    VStack {
      switch destination {
      case .category:
        self.categoryView()
      case .bookmark:
        self.bookmarkView()
      case .home:
        self.homeView()
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

fileprivate extension TabCoordinator {
  private func setTabBarAppearence() {
    let tabBarAppearance = UITabBar.appearance()
    tabBarAppearance.backgroundColor = UIColor(.white)
    tabBarAppearance.shadowImage = UIImage()
  }

  private func setNavigationBarAppearence() {
    let navigationBarAppearance = UINavigationBarAppearance()
    navigationBarAppearance.backgroundColor = UIColor(.white)
    navigationBarAppearance.shadowColor = .clear
    UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    UINavigationBar.appearance().compactAppearance = navigationBarAppearance
  }

  private func setScrollView() {
    UIScrollView.appearance().bounces = false
  }
}
