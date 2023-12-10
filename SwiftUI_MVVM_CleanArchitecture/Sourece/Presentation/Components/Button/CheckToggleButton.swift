//
//  CheckToggleButton.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/9/23.
//

import SwiftUI

struct CheckToggleButton: View {
  @Binding var isActive: Bool
  let label: () -> Text

  var body: some View {
    Button {
      withAnimation(.easeIn(duration: 0.3)) {
        self.isActive.toggle()
      }
    } label: {
      HStack {
        ImageCollecteion.CheckMark.circle
          .resizable()
          .frame(width: 20, height: 20)
          .tint(self.isActive ? ColorPalette.Indigo.indigo1 : ColorPalette.Gray.gray4)

        self.label()
      }
    }
  }
}
