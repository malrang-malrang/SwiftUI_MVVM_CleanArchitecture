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

  enum Lock {
    static var `default` = Image(systemName: "lock")
    static var fill = Image(systemName: "lock.fill")
  }

  enum Building {
    static var `default` = Image(systemName: "building.2")
  }

  enum Xmark {
    static var `default` = Image(systemName: "xmark")
  }

  enum CheckMark {
    static var circle = Image(systemName: "checkmark.circle")
  }

  enum Chevrone {
    static var left = Image(systemName: "chevron.left")
  }

  enum TabBar {
    static var category = Image(systemName: "list.bullet")
    static var bookMark = Image(systemName: "star")
    static var home = Image(systemName: "house")
    static var shoppingBasket = Image(systemName: "cart")
    static var myProfile = Image(systemName: "person")
  }
}
