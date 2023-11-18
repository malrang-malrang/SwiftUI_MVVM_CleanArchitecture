//
//  CacheAsyncImage.swift
//  SwiftUICoordinator
//
//  Created by 김동욱 on 11/14/23.
//

import SwiftUI
import Kingfisher

struct CacheAsyncImage: View {
  let url: String
  let placeholder: Image
  @State var isSuccess: Bool = false

  public var body: some View {
    GeometryReader { proxy in
      if let url = URL(string: self.url) {
        ZStack {
          KFImage(url)
            .placeholder {
              ProgressView()
                .frame(width: proxy.size.width, height: proxy.size.height)
                .controlSize(.large)
                .tint(ColorPalette.Indigo.indigo1)
                .aspectRatio(contentMode: .fit)
                .overlay(
                  RoundedRectangle(cornerRadius: 10)
                    .stroke(ColorPalette.Gray.gray2, lineWidth: 1)
                )
            }
            .onSuccess { _ in self.isSuccess = true }
            .retry(maxCount: 3)
            .resizable()
            .cacheMemoryOnly()
            .fade(duration: 0.2)
            .cancelOnDisappear(true)
            .aspectRatio(contentMode: .fit)
            .frame(width: proxy.size.width, height: proxy.size.height)
            .background(ColorPalette.Gray.gray2)
            .clipShape(RoundedRectangle(cornerRadius: 10))

          if isSuccess {
            Text(Constant.imageSourcesText)
              .font(.title)
              .opacity(0.4)
              .foregroundColor(.white)
          }
        }
      } else {
        self.placeholder
          .aspectRatio(contentMode: .fit)
          .frame(width: proxy.size.width, height: proxy.size.height)
          .background(ColorPalette.Gray.gray2)
          .clipShape(RoundedRectangle(cornerRadius: 10))
      }
    }
    .scaledToFit()
  }
}

private enum Constant {
  static var imageSourcesText: String { "TeamF" }
}

#Preview {
  CacheAsyncImage(
    url: "https://picsum.photos/200/300",
    placeholder: Image(systemName: "swift")
  )
}
