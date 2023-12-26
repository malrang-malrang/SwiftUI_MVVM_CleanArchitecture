//
//  CategoryView.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/7/23.
//

import SwiftUI

struct CategoryView: View {
  @EnvironmentObject var appState: AppStorageService
  @StateObject var coordinator: CategoryCoordinator
  @StateObject var viewModel: CategoryViewModel

  @State var isSignInVisible: Bool = false

  var body: some View {
    NavigationView {
      ZStack {
        self.coordinator.navigationLinkSection()
        self.contentsView()
          .toolbar(content: self.toolbar)
          .fullScreenCover(
            isPresented: self.$isSignInVisible,
            content: { self.coordinator.signInView(isVisible: self.$isSignInVisible) }
          )
      }
    }
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
      if let id = self.appState.userInfo?.id, self.appState.isSign {
        HStack(alignment: .bottom, spacing: 3) {
          Text(id)
            .foregroundStyle(.black)
            .font(FontCollection.NexaBold.font16)
          Text(Constant.representativeMember)
            .foregroundStyle(ColorPalette.Gray.gray7)
            .font(FontCollection.NexaLight.font12)
        }
      } else {
        Button {
          self.withoutAnimation { self.isSignInVisible = true }
        } label: {
          Text(Constant.pleaseLogIn)
            .foregroundStyle(.black)
            .font(.title3)
        }
      }
    }

    ToolbarItemGroup(placement: .navigationBarTrailing) {
      Button {
        print("didTapBell")
      } label: {
        ImageCollecteion.Notice.bell
          .renderingMode(.template)
          .foregroundColor(.gray)
      }
      Button {
        self.coordinator.push(destination: .setting)
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
  static var representativeMember: String { "대표회원" }
}

#Preview {
  CategoryView(
    coordinator: CategoryCoordinator(
      dependencyContainer: DefaultDependencyContainer(),
      parent: nil,
      destination: .root
    ),
    viewModel: CategoryViewModel()
  )
}
