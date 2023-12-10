//
//  SignInViewModel.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/9/23.
//

import SwiftUI

final class SignInViewModel: ViewModelable {
  enum Action {
    case didTapCloseButton
    case didTapSignIn(id: String, password: String)
  }

  struct State {
    @Binding var isVisible: Bool
    @Binding var saveID: Bool
    @Binding var automaticLogin: Bool
    @Binding var userInfo: UserInfo?
    @Binding var isSign: Bool
  }

  @Published var state: State
  private var transaction = Transaction()

  init(
    isVisible: Binding<Bool>,
    saveID: Binding<Bool>,
    automaticLogin: Binding<Bool>,
    userInfo: Binding<UserInfo?>,
    isSign: Binding<Bool>
  ) {
    self.state = State(
      isVisible: isVisible,
      saveID: saveID,
      automaticLogin: automaticLogin,
      userInfo: userInfo,
      isSign: isSign
    )
  }

  func action(_ action: Action) {
    switch action {
    case .didTapCloseButton:
      self.transaction.disablesAnimations = true
      withTransaction(self.transaction) {
        self.state.isVisible = false
      }
    case .didTapSignIn(let id, let password):
      HapticManager.shared.notification(type: .success)
      self.transaction.disablesAnimations = true
      withTransaction(self.transaction) {
        self.state.isVisible = false
      }
//    case .didTapSignIn(let id, let password):
//      let userInfo = UserInfo(id: id, password: password)
//      AppStorageService.shared.isSign = true
//      AppStorageService.shared.userInfo = userInfo
//      self.transaction.disablesAnimations = true
//      withTransaction(self.transaction) {
//        self.state.isVisible = false
//      }
    }
  }
}
