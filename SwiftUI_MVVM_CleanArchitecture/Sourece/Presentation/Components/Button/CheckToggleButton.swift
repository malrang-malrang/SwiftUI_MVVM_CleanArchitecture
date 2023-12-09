//
//  CheckToggleButton.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/9/23.
//

import SwiftUI

struct CheckToggleButton: View {
  @Binding private var isActive: Bool
  private let label: () -> Text?

  init(isActive: Binding<Bool>, label: @escaping () -> Text?) {
    self._isActive = isActive
    self.label = label
  }

  var body: some View {
    Button {
      self.isActive.toggle()
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
