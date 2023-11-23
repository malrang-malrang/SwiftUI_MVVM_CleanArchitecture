//
//  BookMarkView.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/7/23.
//

import SwiftUI

struct BookMarkView: View {
    var body: some View {
      NavigationView {
        self.contensView()
      }
    }

  @ViewBuilder
  private func contensView() -> some View {
    Text("BookMark")
  }
}

#Preview { BookMarkView() }
