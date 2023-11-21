//
//  Coordinator.swift
//  SwiftUI+MVVM+CleanArchitecture
//
//  Created by 김동욱 on 11/11/23.
//

import SwiftUI
import Combine

protocol Coordinator: ObservableObject {
  associatedtype SomeView: View
  associatedtype ViewPath: Destination

  var popToRootViewTriggerName: Notification.Name { get }
  var destination: ViewPath { get set }
  var isRoot: Bool { get }

  var navigationTrigger: Bool { get set }

  @ViewBuilder func composeView() -> SomeView
}

extension Coordinator {
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

  func push(destination: ViewPath) {
    self.destination = destination
    self.navigationTrigger.toggle()
    print(self.destination, self.navigationTrigger)
  }

  func getTrigger() -> Bool {
    self.navigationTrigger
  }

  func setTrigger(newValue: Bool) {
    self.navigationTrigger = newValue
  }
}
