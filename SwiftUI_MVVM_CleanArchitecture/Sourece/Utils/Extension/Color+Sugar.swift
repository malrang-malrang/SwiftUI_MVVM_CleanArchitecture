//
//  Color+Sugar.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/4/23.
//

import SwiftUI

public extension Color {
  init(hexString: String, opacity: Double = 1.0) {
    let hex: Int = Int(hexString, radix: 16)!
    let red = Double((hex >> 16) & 0xff) / 255
    let green = Double((hex >> 8) & 0xff) / 255
    let blue = Double((hex >> 0) & 0xff) / 255
    
    self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
  }

  static var random: Color {
    return Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1),
      opacity: 1
    )
  }
}
