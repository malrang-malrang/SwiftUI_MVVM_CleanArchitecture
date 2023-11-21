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
	func decode<T: Decodable>(_ type: T.Type) throws -> T {
		do {
			switch self {
			case .success(let data):
				return try JSONDecoder().decode(type, from: data)
			case .failure(let error):
				throw error
			}
		}
	}
}
