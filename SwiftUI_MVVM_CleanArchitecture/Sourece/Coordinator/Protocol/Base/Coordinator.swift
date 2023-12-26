//
//  Coordinator.swift
//  SwiftUI+MVVM+CleanArchitecture
//
//  Created by 김동욱 on 11/11/23.
//

import SwiftUI
import Combine

protocol Coordinator: ObservableObject, AnyObject {
  associatedtype SomeView: View
  associatedtype ViewPath: Destination

  var popToRootViewTriggerName: Notification.Name { get }
  var parent: (any Coordinator)? { get }
  var isRoot: Bool { get }
  var destination: ViewPath { get set }
  var cancellable: Set<AnyCancellable> { get set }

  var navigationTrigger: Bool { get set }

  @ViewBuilder func composeView() -> SomeView
}

extension Coordinator {
  func subscribeIsRoot() {
    if self.isRoot {
      NotificationCenter.default.publisher(for: self.popToRootViewTriggerName)
        .sink { [unowned self] _ in
          self.navigationTrigger = false
        }
        .store(in: &cancellable)
    }
  }

  @ViewBuilder
  func navigationLinkSection() -> some View {
    NavigationLink(isActive: Binding<Bool>(
      get: self.getTrigger,
      set: self.setTrigger(newValue:))
    ) {
      self.composeView()
    } label: {
      EmptyView()
    }
  }

  func popToRoot() {
    NotificationCenter.default.post(name: self.popToRootViewTriggerName, object: nil)
  }

  func pop() {
    self.parent?.navigationTrigger = false
  }

  func push(destination: ViewPath) {
    self.destination = destination
    self.navigationTrigger.toggle()
  }

  private func getTrigger() -> Bool {
    self.navigationTrigger
  }

  private func setTrigger(newValue: Bool) {
    self.navigationTrigger = newValue
  }
}
