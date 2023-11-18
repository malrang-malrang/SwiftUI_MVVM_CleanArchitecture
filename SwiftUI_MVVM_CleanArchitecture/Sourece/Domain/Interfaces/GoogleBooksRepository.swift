//
//  GoogleBooksRepository.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/2/23.
//

import Combine
import Moya

protocol GoogleBooksRepository {
  func getBookList(payload: BookSearchRequest) async throws -> Result<SearchResult, MoyaError>
}
