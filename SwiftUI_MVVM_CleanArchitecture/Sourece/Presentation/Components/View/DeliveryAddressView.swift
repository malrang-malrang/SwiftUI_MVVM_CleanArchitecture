//
//  DeliveryAddressView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/28/23.
//

import SwiftUI

struct DeliveryAddressView: View {
  @Binding var isSignIn: Bool
  @Binding var userInfo: UserInfo?
  let beforeSignInAction: () -> Void
  let AfterSignInAction: () -> Void

    var body: some View {
      if self.isSignIn {
        self.afterSignInView()
      } else {
        self.beforeSignInView()
      }
    }

  @ViewBuilder
  private func beforeSignInView() -> some View {
    Button(action: self.beforeSignInAction) {
      HStack(spacing: 5) {
        ImageCollecteion.Lock.fill
          .foregroundStyle(ColorPalette.Gray.gray7)
        Text(Constant.beforeSignInTitle)
          .foregroundStyle(ColorPalette.Gray.gray7)
          .font(FontCollection.NexaLight.font14)
        Spacer()
      }
      .padding(.all, 10)
      .background(ColorPalette.Gray.gray2)
      .cornerRadius(10)
    }
    .buttonStyle(PlainButtonStyle())
  }

  @ViewBuilder
  private func afterSignInView() -> some View {
    HStack(spacing: 10) {
      ImageCollecteion.Building.default
        .foregroundStyle(ColorPalette.Gray.gray7)

      Text(self.userInfo?.id ?? Constant.emptyString)
        .foregroundStyle(ColorPalette.Gray.gray7)
        .font(FontCollection.NexaLight.font14)

      Spacer()

      Button(action: self.AfterSignInAction) {
        Text(Constant.change)
          .font(FontCollection.NexaLight.font12)
          .foregroundStyle(ColorPalette.Gray.gray7)
          .padding(.all, 5)
          .overlay(
            RoundedRectangle(cornerRadius: 5)
              .stroke(ColorPalette.Gray.gray4, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
          )
      }
    }
    .padding(.all, 10)
    .background(ColorPalette.Gray.gray2)
    .cornerRadius(10)
  }
}

fileprivate enum Constant {
  static var emptyString: String { "" }
  static var beforeSignInTitle: String { "로그인 이후 이용 가능합니다." }
  static var change: String { "변경" }
}

#Preview {
  DeliveryAddressView(
    isSignIn: Binding<Bool>.constant(true),
    userInfo: Binding<UserInfo?>.constant(UserInfo(id: "말랑", password: "01054206477")),
    beforeSignInAction: { print("didTapBeforeSignInDeliveryAddressView") },
    AfterSignInAction: { print("didTapAfterSignInDeliveryAddressView") }
  )
}
