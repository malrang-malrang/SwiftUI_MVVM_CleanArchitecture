//
//  MainCoordinator.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import SwiftUI
import Combine

final class MainCoordinator: Coordinator {
  private(set) var popToRootViewTriggerName = Notification.Name(rawValue: "PopToMainRoot")
  private var cancellable: Set<AnyCancellable> = []
  var destination: MainDestination
  var isRoot: Bool
  private unowned var parent: AppCoordinator

  @Published var navigationTrigger = false

  init(parent: AppCoordinator, destination: MainDestination = .tab, isRoot: Bool = false) {
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
    EmptyView()
  }
}
