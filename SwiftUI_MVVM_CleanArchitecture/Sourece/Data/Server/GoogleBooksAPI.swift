//
//  GoogleBooksAPI.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 10/31/23.
//

import UIKit
import Moya

enum GoogleBooksAPI {
  case getBookList(request: BookSearchRequest)
}

extension GoogleBooksAPI: TargetType {
  var baseURL: URL {
    return URL(string: "https://www.googleapis.com")!
  }

  var path: String {
    switch self {
    case .getBookList: return "/books/v1/volumes/"
    }
  }

  var method: Moya.Method {
    switch self {
    case .getBookList: return .get
    }
  }

  var task: Moya.Task {
    switch self {
    case .getBookList(let request):
      return .requestParameters(
        parameters: request.toDictionary ?? [:],
        encoding:URLEncoding.queryString
      )
    }
  }

  var headers: [String: String]? {
    return [
      "Accept": "application/json;charset=UTF-8",
      "Content-Type": "application/json;charset=UTF-8",
    ]
  }

  var sampleData: Data {
    switch self {
    case .getBookList: NSDataAsset(name: "products")!.data
    }
  }
}
