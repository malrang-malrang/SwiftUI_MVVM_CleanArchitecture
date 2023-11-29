//
//  HomeViewModel.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/28/23.
//

import SwiftUI

final class HomeViewModel: ViewModelable {
  enum Action {
    case didTapDeliveryAddressView
  }

  struct State {
    @Binding var isSign: Bool
    @Binding var userInfo: UserInfo?
  }

  @Published var state: State

  init(isSign: Binding<Bool>, userInfo: Binding<UserInfo?>) {
    self.state = State(isSign: isSign, userInfo: userInfo)
  }

  func action(_ action: Action) {
    switch action {
    case .didTapDeliveryAddressView:
      print("didTapDeliveryAddressView")
    }
  }
}
