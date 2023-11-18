//
//  ImageCacheService.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/5/23.
//

import SwiftUI

final class ImageCacheService {
  static let shared = ImageCacheService()
  private var cache = [URL: Image]()

  private init() { }

  func value(forKey key: URL) -> Image? {
    return self.cache[key]
  }

  func setValue(_ value: Image, forKey key: URL) {
    self.cache[key] = value
  }
}
