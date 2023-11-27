//
//  TabContainerViewModel.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/27/23.
//

import Foundation

final class TabContainerViewModel: ViewModelable {
  enum Action {

  }

  struct State {
    var luanchTaskCompleted = false
  }

  @Published var state = State()

  func action(_ action: Action) {

  }
}
