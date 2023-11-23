//
//  DependencyContainer.swift
//  SwiftUI_MVVM_CleanArchitecture
//
//  Created by 김동욱 on 11/23/23.
//

import Foundation

protocol DependencyContainer: AnyObject {
  func makeGetBookListUsecase() -> GetBookListUsecase
}
