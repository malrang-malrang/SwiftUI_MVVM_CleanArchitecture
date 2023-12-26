//
//  BookMarkCoordinator.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/14/23.
//

import SwiftUI
import Combine

final class BookMarkCoordinator: Coordinator, ConvertibleToSignIn {
  private(set) var popToRootViewTriggerName = Notification.Name(rawValue: "PopToBookMakrRoot")
  private(set) weak var dependencyContainer: DependencyContainer?
  private(set) weak var parent: (any Coordinator)?
  var cancellable: Set<AnyCancellable> = []
  var isRoot: Bool

  @Published var destination: BookMarkDestination
  @Published var navigationTrigger = false

  init(
    dependencyContainer: DependencyContainer?,
    parent: (any Coordinator)?,
    destination: BookMarkDestination,
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
      self.bookMarkView()
    }
  }
}

extension BookMarkCoordinator {
  @ViewBuilder
  func bookMarkView() -> some View {
    BookMarkView(appState: AppStorageService.shared, coordinator: self)
  }
}
