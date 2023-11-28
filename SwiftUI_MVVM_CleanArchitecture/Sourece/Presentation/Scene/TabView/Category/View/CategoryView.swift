//
//  CategoryView.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/7/23.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
      NavigationView {
        contentsView()
          .toolbar(content: self.toolbar)
      }
      .navigationViewStyle(.stack)
    }

  @ViewBuilder
  private func contentsView() -> some View {
    Text("Category")
  }
}

// MARK: ToolBar
fileprivate extension CategoryView {
  @ToolbarContentBuilder
  func toolbar() -> some ToolbarContent {
    ToolbarItem(placement: .navigationBarLeading) {
      Button {
        print("didTapSearchButton")
      } label: {
        Text(Constant.pleaseLogIn)
          .foregroundStyle(.black)
          .font(.title3)
      }
    }
    ToolbarItemGroup(placement: .navigationBarTrailing) {
      Button {
        print("didTapSearchButton")
      } label: {
        ImageCollecteion.Notice.bell
          .renderingMode(.template)
          .foregroundColor(.gray)
      }
      Button {
        print("didTapShippingInquiry")
      } label: {
        ImageCollecteion.Setting.gear
          .renderingMode(.template)
          .foregroundColor(.gray)
      }
    }
  }
}

private enum Constant {
  static var pleaseLogIn: String { "로그인해주세요" }
  static var subTitle: String { "당신이 찾는 모든 책" }
}

#Preview { CategoryView() }
