//
//  ViewModelable.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 11/7/23.
//

import SwiftUI

protocol ViewModelable: ObservableObject {
  associatedtype Action
  associatedtype State

  var state: State { get }

  func action(_ action: Action)
}
