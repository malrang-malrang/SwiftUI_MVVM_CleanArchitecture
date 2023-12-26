//
//  ConvertibleToSignIn.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/14/23.
//

import SwiftUI

protocol ConvertibleToSignIn: Coordinator {}

extension ConvertibleToSignIn {
  @ViewBuilder
  func signInView(isVisible: Binding<Bool>) -> some View {
    let viewModel = SignInViewModel()
    SignInView(appState: AppStorageService.shared, viewModel: viewModel, isVisible: isVisible)
  }
}
