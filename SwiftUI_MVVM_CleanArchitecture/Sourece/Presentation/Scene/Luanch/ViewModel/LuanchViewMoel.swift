//
//  LuanchViewMoel.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import SwiftUI

final class LuanchViewMoel: ViewModelable {
  enum Action {
    case onLuanchScreen
  }

  struct State {
    var isAnimation = false
    var isTitleVisible = false
    @Binding var taskCompleted: Bool
  }

  @Published var state: State

  init(isTaskCompleted: Binding<Bool>) {
    self.state = State(taskCompleted: isTaskCompleted)
  }

  func action(_ action: Action) {
    switch action {
    case .onLuanchScreen:
      self.luanchAnimation()
    }
  }

  private func luanchAnimation() {
    DispatchQueue.main.asyncAfter(
      deadline: .now() + 1,
      execute: {
        self.state.isAnimation.toggle()
      }
    )

    DispatchQueue.main.asyncAfter(
      deadline: .now() + 2,
      execute: {
        self.state.isTitleVisible.toggle()
      }
    )

    DispatchQueue.main.asyncAfter(
      deadline: .now() + 4,
      execute: {
        self.state.taskCompleted.toggle()
      }
    )
  }
}
