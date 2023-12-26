//
//  HomeView.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/7/23.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var appState: AppStorageService
  @StateObject var coordinator: HomeCoordinator
  @StateObject var viewModel: HomeViewModel

  @State var isSignInVisible: Bool = false

  var body: some View {
    NavigationView {
      ZStack {
        self.coordinator.navigationLinkSection()
        self.contentsView()
          .toolbar(content: homeViewToolbar)
          .fullScreenCover(
            isPresented: self.$isSignInVisible,
            content: { self.coordinator.signInView(isVisible: self.$isSignInVisible) }
          )
      }
    }
  }

  @ViewBuilder
  private func contentsView() -> some View {
    GeometryReader { proxy in
      ScrollView {
        VStack {
          DeliveryAddressView(
            isSignIn: self.appState.$isSign,
            userInfo: self.appState.$userInfo,
            beforeSignInAction: {
              self.withoutAnimation { self.isSignInVisible = true }
            },
            AfterSignInAction: {
              print("didTapDeliveryAddressView")
            }
          )
          .padding(.horizontal, 10)

          Spacer(minLength: 20)

        }
        .background(Color.white)

      }
      .frame(width: proxy.size.width)
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

#Preview {
  HomeView(
    coordinator: HomeCoordinator(
      dependencyContainer: DefaultDependencyContainer(),
      parent: nil,
      destination: .root
    ),
    viewModel: HomeViewModel())
}
