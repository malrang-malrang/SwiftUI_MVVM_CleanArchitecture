//
//  Optional+Sugar.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/29/23.
//

import Foundation

extension Optional: RawRepresentable where Wrapped: Codable {
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self) else {
            return "{}"
        }
        return String(decoding: data, as: UTF8.self)
    }

    public init?(rawValue: String) {
        guard let value = try? JSONDecoder().decode(Self.self, from: Data(rawValue.utf8)) else {
            return nil
        }
        self = value
    }
}
