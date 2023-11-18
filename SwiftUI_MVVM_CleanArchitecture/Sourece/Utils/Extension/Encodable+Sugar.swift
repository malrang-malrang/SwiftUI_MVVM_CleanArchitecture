//
//  Encodable+Sugar.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/2/23.
//

import Foundation

extension Encodable {
  var toDictionary : [String: Any]? {
    guard let object = try? JSONEncoder().encode(self) else { return nil }
    guard let dictionary = try? JSONSerialization.jsonObject(with: object, options: [])
            as? [String: Any] else {
      return nil
    }
    return dictionary
  }
}
