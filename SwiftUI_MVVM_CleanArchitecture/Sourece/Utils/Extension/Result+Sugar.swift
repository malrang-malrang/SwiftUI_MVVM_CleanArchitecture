//
//  Result+Sugar.swift
//  SwiftUICoordinator
//
//  Created by 김동욱 on 11/14/23.
//

import Foundation
import Moya

public extension Result where Success == (data: Data, response: URLResponse) {
  func map<T>(_ keyPath: KeyPath<Success, T>) -> Result<T, Failure> {
    switch self {
    case .success(let response):
      return .success(response[keyPath: keyPath])
    case .failure(let error):
      return .failure(error)
    }
  }
}

public extension Result where Success == Data {
  func decode<T: Decodable>(_ type: T.Type) -> Result<T, MoyaError> {
    do {
      return .success(try JSONDecoder().decode(type, from: try get()))
    } catch {
      return .failure(error as? MoyaError ?? .encodableMapping(error))
    }
  }
}
