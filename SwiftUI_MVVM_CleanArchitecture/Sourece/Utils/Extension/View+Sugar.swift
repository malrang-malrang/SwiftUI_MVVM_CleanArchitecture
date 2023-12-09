//
//  View+Sugar.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/7/23.
//

import SwiftUI

extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(
      #selector(UIResponder.resignFirstResponder),
      to: nil,
      from: nil,
      for: nil
    )
  }
}
