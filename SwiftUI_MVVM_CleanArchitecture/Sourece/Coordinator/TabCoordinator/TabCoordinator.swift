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
  private var cancellable: Set<AnyCancellable> = []
  private var parent: AppCoordinator
  @Published var destination: TabDestination
  var isRoot: Bool

  @Published var navigationTrigger = false

  init(parent: AppCoordinator, destination: TabDestination = .home, isRoot: Bool = false) {
    self.parent = parent
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
    TabContainerView(viewModel: LuanchViewMoel())
      .environmentObject(self)
      .navigationBarHidden(true)
  }
}
