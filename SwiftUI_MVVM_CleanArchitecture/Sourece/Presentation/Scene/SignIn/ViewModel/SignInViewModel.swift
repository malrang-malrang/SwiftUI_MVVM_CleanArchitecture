//
//  SignInViewModel.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/9/23.
//

import Combine

final class SignInViewModel: ViewModelable {
  enum Action {
    case didTapSignIn(id: String, password: String)
  }

  struct State {
    var isAlert: Bool = false
    var errorMessage: String = ""
    var signInTask: Bool = false
  }

  @Published var state = State()

  func action(_ action: Action) {
    switch action {
    case .didTapSignIn(let id, let password):
      if id.isEmpty {
        self.state.errorMessage = "ID를 확인해주세요."
        self.state.isAlert = true
        return
      }
      if password.isEmpty {
        self.state.errorMessage = "Password를 확인해주세요."
        self.state.isAlert = true
        return
      }
      AppStorageService.shared.isSign = true
      AppStorageService.shared.userInfo = UserInfo(id: id, password: password)
      self.state.signInTask = true
    }
  }
}
