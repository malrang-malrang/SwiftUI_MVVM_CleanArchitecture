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

  enum Category {
    static var tab = Image(systemName: "list.bullet")
  }
}
