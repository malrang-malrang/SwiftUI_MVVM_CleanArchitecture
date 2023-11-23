//
//  AppDestination.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/21/23.
//

import Foundation

enum AppDestination: Destination {
  case tab(TabDestination)
}
