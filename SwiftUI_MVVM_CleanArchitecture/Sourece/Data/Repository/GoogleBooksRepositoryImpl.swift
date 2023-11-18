//
//  GoogleBooksRepositoryImpl.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 10/31/23.
//

import Foundation
import Combine
import Moya

final class GoogleBooksRepositoryImpl: GoogleBooksRepository {
  private let googleBooksProvider: NetworkProvider<GoogleBooksAPI>

  init(googleBooksProvider: NetworkProvider<GoogleBooksAPI> = NetworkProvider<GoogleBooksAPI>()) {
    self.googleBooksProvider = googleBooksProvider
  }

  func getBookList(payload: BookSearchRequest) async throws -> Result<SearchResult, MoyaError> {
    return await self.googleBooksProvider
      .request(target: .getBookList(request: payload))
      .map(\.data)
      .decode(SearchResultDTO.self)
      .map { $0.toDomain() }
  }
}
