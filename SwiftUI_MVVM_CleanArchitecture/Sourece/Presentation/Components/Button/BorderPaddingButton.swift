//
//  BorderPaddingButton.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/4/23.
//

import SwiftUI

struct BorderPaddingButton: View {
  private let systemName: String?
  private let title: String?
  private let action: () -> Void

  init(
    systemName: String?,
    title: String?,
    action: @escaping () -> Void
  ) {
    self.systemName = systemName
    self.title = title
    self.action = action
  }

    var body: some View {
      Button(action: self.action) {
        if let imageName = self.systemName {
          Image(systemName: imageName)
            .tint(ColorPalette.Gray.gray7)
        }
        if let title = self.title {
          Text(title)
            .foregroundStyle(ColorPalette.Gray.gray7)
            .font(.caption)
        }
      }
      .padding(.all, 10)
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(ColorPalette.Gray.gray4, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
      )
    }
}

#Preview {
  BorderPaddingButton(
    systemName: "phone",
    title: "전화로 문의하기",
    action: {}
  )
}
