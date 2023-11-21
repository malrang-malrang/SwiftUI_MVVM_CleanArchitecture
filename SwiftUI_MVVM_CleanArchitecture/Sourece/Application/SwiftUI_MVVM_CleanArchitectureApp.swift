//
//  SwiftUI_MVVM_CleanArchitectureApp.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/18/23.
//

import SwiftUI

@main
struct SwiftUI_MVVM_CleanArchitectureApp: App {
  private let appCoordinator = AppCoordinator(isRoot: true)

  var body: some Scene {
    WindowGroup {
      self.appCoordinator.composeView()
    }
  }
}
