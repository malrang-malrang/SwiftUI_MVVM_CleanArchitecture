//
//  SignInView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/5/23.
//

import SwiftUI

struct SignInView: View {
  @Environment(\.presentationMode) var presentation
  private var transaction = Transaction()

  init() {
    self.transaction.disablesAnimations = true
  }

  var body: some View {
    self.contentsView()
  }

  @ViewBuilder
  private func contentsView() -> some View {
    GeometryReader { geometry in
      self.closeButton()
        .offset(x: 20, y: 20)

      self.titleView(x: geometry.size.width / 2, y: geometry.size.height / 5)
    }
    .background(.white)
  }

  @ViewBuilder
  private func closeButton() -> some View {
    Button(
      action: {
        withTransaction(self.transaction) {
          self.presentation.wrappedValue.dismiss()
        }
      },
      label: { ImageCollecteion.Xmark.default.foregroundStyle(ColorPalette.Gray.gray6) }
    )
  }

  @ViewBuilder
  private func titleView(x: CGFloat, y: CGFloat) -> some View {
    VStack(spacing: 2) {
      Text(Constant.subTitle)
        .foregroundStyle(ColorPalette.Indigo.indigo1)
        .font(FontCollection.NexaLight.font12)

      Text(Constant.title)
        .foregroundStyle(ColorPalette.Indigo.indigo1)
        .font(FontCollection.NexaBold.font40)
    }
    .position(x: x, y: y)
  }
}

fileprivate enum Constant {
  static var title: String { "새벽서점" }
  static var subTitle: String { "당신이 찾는 모든 책" }
}

#Preview {
  SignInView()
}
