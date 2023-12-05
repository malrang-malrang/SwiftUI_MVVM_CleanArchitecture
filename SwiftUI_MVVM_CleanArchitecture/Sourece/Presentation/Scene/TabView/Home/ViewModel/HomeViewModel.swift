//
//  HomeViewModel.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/28/23.
//

import SwiftUI

final class HomeViewModel: ViewModelable {
  enum Action {
    case didTapBeforeSignInAction
    case didTapAfterSignInAction
  }

  struct State {
    @Binding var isSign: Bool
    @Binding var userInfo: UserInfo?
    var isSignInVisible: Bool = false
  }

  @Published var state: State
  private var transaction = Transaction()

  init(isSign: Binding<Bool>, userInfo: Binding<UserInfo?>) {
    self.state = State(isSign: isSign, userInfo: userInfo)
  }

  func action(_ action: Action) {
    switch action {
    case .didTapBeforeSignInAction:
      self.transaction.disablesAnimations = true
      withTransaction(self.transaction) {
        self.state.isSignInVisible = true
      }
    case .didTapAfterSignInAction:
      print("didTapAfterSignInAction")
    }
  }
}
