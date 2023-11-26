//
//  LuanchViewMoel.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import Foundation

final class LuanchViewMoel: ViewModelable {
  enum Action {
    case onLuanchScreen
  }

  struct State {
    var isAnimation = true
    var taskCompleted = false
  }

  @Published var state = State()

  func action(_ action: Action) {
    switch action {
    case .onLuanchScreen:
      self.luanchAnimation()
    }
  }

  private func luanchAnimation() {
    DispatchQueue.main.asyncAfter(
      deadline: .now() + 2,
      execute: {
        self.state.isAnimation.toggle()
        self.state.taskCompleted.toggle()
      }
    )
  }
}
