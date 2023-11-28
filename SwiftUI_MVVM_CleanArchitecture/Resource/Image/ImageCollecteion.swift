//
//  ImageCollecteion.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/19/23.
//

import SwiftUI

enum ImageCollecteion {
  enum Malrang {
    static var nukki = Image("MalrangNuKKI")
  }

  enum Butter {
    static var nukki = Image("ButterNukki")
  }

  enum Notice {
    static var bell = Image(systemName: "bell")
  }

  enum Setting {
    static var gear = Image(systemName: "gearshape")
  }

  enum Search {
    static var `default` = Image(systemName: "magnifyingglass")
  }

  enum Box {
    static var `default` = Image(systemName: "shippingbox")
  }

  enum TabBar {
    static var category = Image(systemName: "list.bullet")
    static var bookMark = Image(systemName: "star")
    static var home = Image(systemName: "house")
    static var shoppingBasket = Image(systemName: "cart")
    static var myProfile = Image(systemName: "person")
  }
}
