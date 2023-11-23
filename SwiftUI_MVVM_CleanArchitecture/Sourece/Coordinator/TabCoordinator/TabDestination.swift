//
//  TabDestination.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import Foundation
import SwiftUI

enum TabDestination: Destination {
  case category
  case bookmark
  case home
  case shoppingBasket
  case myProfile
}

extension TabDestination {
  var title: String {
    switch self {
    case .category: "카테고리"
    case .bookmark: "즐겨찾기"
    case .home: "홈"
    case .shoppingBasket: "장바구니"
    case .myProfile: "내정보"
    }
  }

  @ViewBuilder
  var tabBarItem: some View {
    switch self {
    case .category:
      VStack {
        ImageCollecteion.Category.tab
        Text(self.title)
      }
    case .bookmark:
      EmptyView()
    case .home:
      EmptyView()
    case .shoppingBasket:
      EmptyView()
    case .myProfile:
      EmptyView()
    }
  }
}
