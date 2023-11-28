//
//  FontCollection.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/19/23.
//

import SwiftUI

enum FontCollection {
  enum NexaLight {
    static var font12 = Font.custom("Nexa-Light", size: 12)
    static var font14 = Font.custom("Nexa-Light", size: 14)
    static var font16 = Font.custom("Nexa-Light", size: 16)
    static var font18 = Font.custom("Nexa-Light", size: 18)
  }

  enum NexaBold {
    static var font18 = Font.custom("Nexa-Bold", size: 18)
    static var font24 = Font.custom("Nexa-Bold", size: 24)
    static var font28 = Font.custom("Nexa-Bold", size: 28)
    static var font32 = Font.custom("Nexa-Bold", size: 32)
    static var font50 = Font.custom("Nexa-Bold", size: 50)
    static var font55 = Font.custom("Nexa-Bold", size: 55)
    static var font60 = Font.custom("Nexa-Bold", size: 60)
  }
}
