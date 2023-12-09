//
//  SignInView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/5/23.
//

import SwiftUI

final class SignInViewModel: ViewModelable {
  enum Action {

  }

  enum FocusedField {
    case id
    case password
  }

  struct State {
    @Binding var id: String
    @Binding var password: String
  }

  @Published var state: State
  @FocusState var focusedField: FocusedField?

  init() {
    self.state = State(id: .constant(""), password: .constant(""))
  }

  func action(_ action: Action) {

  }
}

struct SignInView: View {
  @Environment(\.presentationMode) var presentation
  @StateObject var viewModel: SignInViewModel

  var transaction = Transaction()

  var body: some View {
    self.contentsView()
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
      }
      .offset(y: 80)
    }
    .background(.white)
    .onTapGesture { self.hideKeyboard() }
  }

  @ViewBuilder
  private func closeButton() -> some View {
    Button {
      withTransaction(self.transaction) { self.presentation.wrappedValue.dismiss() }
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
    TextField(text: self.viewModel.state.$id) {
      Text((self.viewModel.focusedField == .id) ? "" : Constant.inputId)
        .font(FontCollection.NexaLight.font14)
        .foregroundStyle(ColorPalette.Gray.gray4)
    }
    .tint(ColorPalette.Indigo.indigo1)
    .frame(height: 40)
    .padding(.leading, 10)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(
          (self.viewModel.focusedField == .id)
          ? ColorPalette.Indigo.indigo1
          : ColorPalette.Gray.gray4,
          lineWidth: 1
        )
    )
    .focused(self.viewModel.$focusedField, equals: .id)
  }

  @ViewBuilder
  private func passwordTextField() -> some View {
    TextField(text: self.viewModel.state.$password) {
      Text((self.viewModel.focusedField == .password) ? "" : Constant.inputPassword)
        .font(FontCollection.NexaLight.font14)
        .foregroundStyle(ColorPalette.Gray.gray4)
    }
    .tint(ColorPalette.Indigo.indigo1)
    .frame(height: 40)
    .padding(.leading, 10)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(
          (self.viewModel.focusedField == .password)
          ? ColorPalette.Indigo.indigo1
          : ColorPalette.Gray.gray4,
          lineWidth: 1
        )
    )
    .focused(self.viewModel.$focusedField, equals: .password)
  }

  @ViewBuilder
  private func saveButtonList() -> some View {
    HStack(spacing: 15) {
      CheckToggleButton(isActive: Binding<Bool>.constant(false)) {
        Text(Constant.saveID)
          .font(FontCollection.NexaLight.font14)
          .foregroundColor(.black)
      }

      CheckToggleButton(isActive: Binding<Bool>.constant(true)) {
        Text(Constant.automaticLogin)
          .font(FontCollection.NexaLight.font14)
          .foregroundColor(.black)
      }
    }
  }

  @ViewBuilder
  private func signInButton() -> some View {
    Button(action: {
      print("didTapSignIn")
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
}

fileprivate enum Constant {
  static var title: String { "새벽서점" }
  static var subTitle: String { "당신이 찾는 모든 책" }
  static var inputId: String { "아이디 입력" }
  static var inputPassword: String { "비밀번호 입력" }
  static var signIn: String { "로그인" }
  static var saveID: String { "아이디 저장" }
  static var automaticLogin: String { "자동 로그인" }
}

#Preview {
  SignInView(viewModel: SignInViewModel())
}
