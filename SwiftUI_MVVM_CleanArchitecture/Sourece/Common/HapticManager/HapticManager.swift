//
//  HapticManager.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/9/23.
//

import SwiftUI

final class HapticManager {
  static let shared = HapticManager()

  func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(type)
  }

  func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
  }
}
