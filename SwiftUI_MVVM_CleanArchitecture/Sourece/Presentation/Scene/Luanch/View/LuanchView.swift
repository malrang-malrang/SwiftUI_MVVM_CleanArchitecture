//
//  LuanchView.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/19/23.
//

import SwiftUI

struct LuanchView: View {
  @StateObject var viewModel: LuanchViewMoel

  var body: some View {
    NavigationView {
      self.contentsView()
        .background(ColorPalette.Indigo.indigo1)
        .onAppear { self.viewModel.action(.onLuanchScreen) }
    }
  }

  @ViewBuilder
  private func contentsView() -> some View {
    GeometryReader { geometry in
      ZStack {
        ImageCollecteion.Malrang.nukki
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(
            width: self.viewModel.state.isAnimation ? 100 : 120,
            height: self.viewModel.state.isAnimation ? 100 : 120
          )
          .position(x: (geometry.size.width / 2) - 5, y: geometry.size.height / 3)
          .animation(.spring(response: 2), value: self.viewModel.state.isAnimation)

        titleView(x: geometry.size.width / 2, y: geometry.size.height / 2.3)
      }
    }
    .background(ColorPalette.Indigo.indigo1)
  }

  @ViewBuilder
  private func titleView(x: CGFloat, y: CGFloat) -> some View {
    VStack(spacing: 5) {
      Text(Constant.subTitle)
        .foregroundStyle(.white)
        .font(FontCollection.NexaLight.font14)

      Text(Constant.title)
        .foregroundStyle(.white)
        .font(FontCollection.NexaBold.font55)
    }
    .position(x: x, y: y)
  }
}

private enum Constant {
  static var title: String { "새벽책방" }
  static var subTitle: String { "당신이 찾는 모든 책" }
}

#Preview { LuanchView(viewModel: LuanchViewMoel()) }
