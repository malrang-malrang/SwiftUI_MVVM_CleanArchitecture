//
//  AppStorageServiceKey.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/29/23.
//

import Foundation

enum AppStorageServiceKey: String {
  case isSign
  case userInfo
}

extension AppStorageServiceKey {
  var value: String {
    return self.rawValue
  }
}
