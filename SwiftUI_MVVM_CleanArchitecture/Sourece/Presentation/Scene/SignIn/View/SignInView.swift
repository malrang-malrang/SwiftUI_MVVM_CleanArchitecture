//
//  SignInView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/5/23.
//

import SwiftUI

struct SignInView: View {
  enum FocusedField {
    case id
    case password
  }

  @StateObject var viewModel: SignInViewModel
  @FocusState var focusedField: FocusedField?
  @State var id: String = ""
  @State var password: String = ""

  var body: some View {
    NavigationView {
      self.contentsView()
    }
  }

  @ViewBuilder
  private func contentsView() -> some View {
    GeometryReader { geometry in
      self.closeButton()
        .offset(x: 20, y: 20)

      VStack(alignment: .center) {
        self.titleView()
          .padding(.bottom, 40)

        VStack(alignment: .leading) {
          self.idTextField()
            .padding(.horizontal, 20)

          self.passwordTextField()
            .padding(.horizontal, 20)

          self.saveButtonList()
            .padding(.top, 5)
            .padding(.leading, 20)

          self.signInButton()
            .padding([.top, .horizontal], 20)
        }

        self.accountButtonList()
          .padding(.top, 10)

      }
      .offset(y: 80)
    }
    .background(.white)
    .onTapGesture { self.hideKeyboard() }
  }

  @ViewBuilder
  private func closeButton() -> some View {
    Button {
      self.viewModel.action(.didTapCloseButton)
    } label: {
      ImageCollecteion.Xmark.default.foregroundStyle(ColorPalette.Gray.gray6)
    }
  }

  @ViewBuilder
  private func titleView() -> some View {
    VStack(spacing: 2) {
      Text(Constant.subTitle)
        .foregroundStyle(ColorPalette.Indigo.indigo1)
        .font(FontCollection.NexaLight.font12)

      Text(Constant.title)
        .foregroundStyle(ColorPalette.Indigo.indigo1)
        .font(FontCollection.NexaBold.font40)
    }
  }

  @ViewBuilder
  private func idTextField() -> some View {
    TextField(text: self.$id) {
      Text((self.focusedField == .id) ? "" : Constant.inputId)
        .font(FontCollection.NexaLight.font14)
        .foregroundStyle(ColorPalette.Gray.gray4)
    }
    .tint(ColorPalette.Indigo.indigo1)
    .frame(height: 40)
    .padding(.leading, 10)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(
          (self.focusedField == .id)
          ? ColorPalette.Indigo.indigo1
          : ColorPalette.Gray.gray4,
          lineWidth: 1
        )
    )
    .focused(self.$focusedField, equals: .id)
  }

  @ViewBuilder
  private func passwordTextField() -> some View {
    TextField(text: self.$password) {
      Text((self.focusedField == .password) ? "" : Constant.inputPassword)
        .font(FontCollection.NexaLight.font14)
        .foregroundStyle(ColorPalette.Gray.gray4)
    }
    .tint(ColorPalette.Indigo.indigo1)
    .frame(height: 40)
    .padding(.leading, 10)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(
          (self.focusedField == .password)
          ? ColorPalette.Indigo.indigo1
          : ColorPalette.Gray.gray4,
          lineWidth: 1
        )
    )
    .focused(self.$focusedField, equals: .password)
  }

  @ViewBuilder
  private func saveButtonList() -> some View {
    HStack(spacing: 15) {
      CheckToggleButton(isActive: self.$viewModel.state.saveID) {
        Text(Constant.saveID)
          .font(FontCollection.NexaLight.font14)
          .foregroundColor(.black)
      }

      CheckToggleButton(isActive: self.$viewModel.state.automaticLogin) {
        Text(Constant.automaticLogin)
          .font(FontCollection.NexaLight.font14)
          .foregroundColor(.black)
      }
    }
  }

  @ViewBuilder
  private func signInButton() -> some View {
    Button(action: {
      self.viewModel.action(.didTapSignIn(id: self.id, password: self.password))
    }, label: {
      Text(Constant.signIn)
        .font(FontCollection.NexaBold.font16)
        .foregroundStyle(.white)
        .padding(10)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(ColorPalette.Indigo.indigo1)
        .cornerRadius(8)
    })
  }

  @ViewBuilder
  private func accountButtonList() -> some View {
    HStack(spacing: 15) {
      Button {
        print("didTapFindID")
      } label: {
        Text(Constant.findID)
          .foregroundStyle(.black)
          .font(FontCollection.NexaLight.font13)
      }

      Divider()
        .frame(width: 2, height: 15)
        .foregroundStyle(ColorPalette.Gray.gray7)

      Button {
        print("didTapFindPassword")
      } label: {
        Text(Constant.findPassword)
          .foregroundStyle(.black)
          .font(FontCollection.NexaLight.font13)
      }

      Divider()
        .frame(width: 2, height: 15)
        .foregroundStyle(ColorPalette.Gray.gray7)

      Button {
        print("didTapJoinMembership")
      } label: {
        Text(Constant.joinMembership)
          .foregroundStyle(.black)
          .font(FontCollection.NexaLight.font13)
      }
    }
  }
}

fileprivate enum Constant {
  static var title: String { "새벽서점" }
  static var subTitle: String { "당신이 찾는 모든 책" }
  static var inputId: String { "아이디 입력" }
  static var inputPassword: String { "비밀번호 입력" }
  static var signIn: String { "로그인" }
  static var saveID: String { "아이디 저장" }
  static var automaticLogin: String { "자동 로그인" }
  static var findID: String { "아이디 찾기" }
  static var findPassword: String { "비밀번호 찾기" }
  static var joinMembership: String { "회원가입" }
}

#Preview {
  SignInView(viewModel: SignInViewModel(
    isVisible: .constant(true),
    saveID: .constant(false),
    automaticLogin: .constant(false),
    userInfo: .constant(nil),
    isSign: .constant(false)
  ))
}
