//
//  GetBookListUsecase.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/2/23.
//

import Combine
import Moya

protocol GetBookListUsecase {
  func execute(title: String, startIndex: Int, maxResult: Int) async throws -> SearchResult
}

final class DefaultGetBookListUsecase: GetBookListUsecase {
  private let googleBooksRepository: GoogleBooksRepository

  init(googleBooksRepository: GoogleBooksRepository) {
    self.googleBooksRepository = googleBooksRepository
  }

  func execute(title: String, startIndex: Int, maxResult: Int) async throws -> SearchResult {
    let payload = BookSearchRequest(
      title: title,
      startIndex: startIndex,
      maxResult: maxResult
    )
    return try await self.googleBooksRepository.getBookList(payload: payload)
  }
}
