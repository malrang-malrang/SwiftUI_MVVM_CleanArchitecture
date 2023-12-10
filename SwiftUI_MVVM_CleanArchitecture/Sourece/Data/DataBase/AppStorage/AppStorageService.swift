//
//  AppStorageService.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/29/23.
//

import Foundation
import SwiftUI

final class AppStorageService: ObservableObject {
  static let shared = AppStorageService()

  private init() { }

  @AppStorage(AppStorageServiceKey.isSign.value)
  var isSign: Bool = false

  @AppStorage(AppStorageServiceKey.userInfo.value)
  var userInfo: UserInfo? = nil

  @AppStorage(AppStorageServiceKey.automaticLogin.value)
  var automaticLogin: Bool = false

  @AppStorage(AppStorageServiceKey.saveID.value)
  var saveID: Bool = false
}

