//
//  SettingView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/10/23.
//

import SwiftUI

struct SettingView<Coordinator>: View where Coordinator: ConvertibleToSignIn {
  @EnvironmentObject var appState: AppStorageService
  @StateObject var coordinator: Coordinator

  @State var isSignInVisible: Bool = false

  var body: some View {
    NavigationView {
      ZStack {
        self.coordinator.navigationLinkSection()
        self.contentsView()
          .fullScreenCover(isPresented: self.$isSignInVisible) {
            self.coordinator.signInView(isVisible: self.$isSignInVisible)
          }
      }
    }
  }

  @ViewBuilder
  private func contentsView() -> some View {
    VStack {
      self.headerView()
        .padding(.horizontal, 20)

      self.automaticLoginToggleView()
        .padding(.horizontal, 20)

    }
    .background(ColorPalette.Gray.gray2)
  }

  @ViewBuilder
  private func headerView() -> some View {
    if (self.appState.isSign) {
      self.signOutView()
    } else {
      self.goToLogInButton()
    }
  }

  @ViewBuilder
  private func goToLogInButton() -> some View {
    HStack {
      Button {
        self.withoutAnimation { self.isSignInVisible = true }
      } label: {
        Text(Constant.goToLogIn)
          .foregroundStyle(.black)
          .font(FontCollection.NexaBold.font18)
      }
      Spacer()
    }
    .background(.white)
  }

  @ViewBuilder
  private func signOutView() -> some View {
    HStack {
      Text(self.appState.userInfo?.id ?? "")
      Spacer()
      Button {
        self.signOut()
      } label: {
        Text(Constant.signOut)
          .foregroundStyle(ColorPalette.Gray.gray7)
          .font(FontCollection.NexaLight.font12)
      }
      .padding(.all, 5)
      .overlay(
        RoundedRectangle(cornerRadius: 2.5)
          .stroke(ColorPalette.Gray.gray4, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
      )
    }
    .background(.white)
  }

  @ViewBuilder
  private func automaticLoginToggleView() -> some View {
    Toggle(Constant.automaticLogin, isOn: self.appState.$automaticLogin)
      .toggleStyle(SwitchToggleStyle(tint: ColorPalette.Indigo.indigo1))
      .disabled(!self.appState.isSign)
      .background(.white)
  }
}

fileprivate extension SettingView {
  private func signOut() {
    self.appState.isSign = false
    self.appState.automaticLogin = false
    if self.appState.saveID {
      self.appState.userInfo = UserInfo(id: self.appState.userInfo?.id ?? "", password: "")
    } else {
      self.appState.userInfo = nil
    }
  }
}

private enum Constant {
  static var goToLogIn: String { "로그인 하러가기" }
  static var signOut: String { "로그아웃" }
  static var automaticLogin: String { "자동로그인" }
}

#Preview {
  SettingView(
    coordinator: CategoryCoordinator(
      dependencyContainer: DefaultDependencyContainer(),
      parent: nil,
      destination: .setting
    )
  )
}
