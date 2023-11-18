//
//  NetworkProvider.swift
//  SwiftUICoordinator
//
//  Created by 김동욱 on 11/13/23.
//

import Foundation
import Moya

final class NetworkProvider<T: TargetType>: MoyaProvider<T> {
  init() {
    super.init(plugins: [NetworkLoggerPlugin()])
  }

  init(sampleStatusCode: Int) {
    let endPointClosure = { (target: T) -> Endpoint in
      let sampleResponseClosure: () -> EndpointSampleResponse = {
        EndpointSampleResponse.networkResponse(sampleStatusCode, target.sampleData)
      }
      return Endpoint(
        url: URL(target: target).absoluteString,
        sampleResponseClosure: sampleResponseClosure,
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers
      )
    }
    super.init(endpointClosure: endPointClosure)
  }
}

extension NetworkProvider {
  func request(target: Target) async -> Result<Response, MoyaError> {
    await withCheckedContinuation { continuation in
      self.request(target) { result in
        continuation.resume(returning: result)
      }
    }
  }
}
