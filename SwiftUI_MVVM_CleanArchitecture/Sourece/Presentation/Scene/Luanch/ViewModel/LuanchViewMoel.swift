//
//  LuanchViewMoel.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import Foundation

final class LuanchViewMoel: ViewModelable {
  enum Action {
    case onAppear
  }

  struct State {
    var isAnimation = false
  }

  @Published var state = State()

  func action(_ action: Action) {
    switch action {
    case .onAppear:
      self.state.isAnimation = true
    }
  }
}
