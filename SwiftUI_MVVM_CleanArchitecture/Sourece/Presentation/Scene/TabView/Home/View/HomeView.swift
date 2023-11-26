//
//  HomeView.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/7/23.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    NavigationView {
      contentsView()
        .toolbar(content: homeViewToolbar)
    }
    .navigationViewStyle(.stack)
  }

  @ViewBuilder
  private func contentsView() -> some View {
    GeometryReader { proxy in
      ScrollView {
        VStack {
          Text("Home")
          BusinessInfoView()
            .padding(.horizontal, 10)
        }
        .frame(width: proxy.size.width)
      }
      .background(ColorPalette.Gray.gray2)
    }
  }
}

// MARK: ToolBar
fileprivate extension HomeView {
  @ToolbarContentBuilder
  func homeViewToolbar() -> some ToolbarContent {
    ToolbarItem(placement: .navigationBarLeading) {
      Text(Constant.appName)
        .foregroundStyle(ColorPalette.Indigo.indigo2)
        .font(FontCollection.NexaBold.font28)
    }
    ToolbarItemGroup(placement: .navigationBarTrailing) {
      Button {
        print("didTapSearchButton")
      } label: {
        ImageCollecteion.Search.default
          .renderingMode(.template)
          .foregroundColor(.gray)
      }
      Button {
        print("didTapShippingInquiry")
      } label: {
        ImageCollecteion.Box.default
          .renderingMode(.template)
          .foregroundColor(.gray)
      }
    }
  }
}

private enum Constant {
  static var appName: String { "새벽서점" }
}

#Preview { HomeView() }
