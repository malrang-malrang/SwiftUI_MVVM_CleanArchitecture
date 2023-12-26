//
//  DefaultDependencyContainer.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/23/23.
//

import Foundation

final class DefaultDependencyContainer: DependencyContainer {
  private let googleBooksRepository: GoogleBooksRepository = GoogleBooksRepositoryImpl()

  func makeGetBookListUsecase() -> GetBookListUsecase {
    return DefaultGetBookListUsecase(googleBooksRepository: self.googleBooksRepository)
  }
}
