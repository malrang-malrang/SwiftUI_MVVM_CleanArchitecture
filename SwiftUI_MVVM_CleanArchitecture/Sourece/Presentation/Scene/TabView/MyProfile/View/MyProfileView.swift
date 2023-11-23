//
//  MyProfileView.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/7/23.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
      NavigationView {
        contensView()
      }
      .navigationViewStyle(.stack)
    }

  @ViewBuilder
  private func contensView() -> some View {
    Text("MyProfile")
  }
}

#Preview { MyProfileView() }
