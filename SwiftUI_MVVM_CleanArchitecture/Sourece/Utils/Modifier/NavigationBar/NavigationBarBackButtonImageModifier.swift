//
//  NavigationBarBackButtonImage.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 12/14/23.
//

import SwiftUI

extension View {
  func navigationBarBackButtonImage(_ backButtonImage: Image) -> some View {
    self.modifier(NavigationBarBackButtonImageModifier(backButtonImage: backButtonImage))
  }
}

struct NavigationBarBackButtonImageModifier: ViewModifier {
  @Environment(\.presentationMode) var presentationMode
  var backButtonImage: Image

  func body(content: Content) -> some View {
    content
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(leading: self.backButton)
  }

  private var backButton: some View {
    Button {
      self.presentationMode.wrappedValue.dismiss()
    } label: {
      self.backButtonImage
    }
  }
}
