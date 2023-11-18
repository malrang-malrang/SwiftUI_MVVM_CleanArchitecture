//
//  APILoggerPlugin.swift
//  FirstSwiftUI
//
//  Created by 김동욱 on 10/31/23.
//

import Moya
import OSLog

final class APILoggerPlugin: PluginType {
  func willSend(_ request: RequestType, target: TargetType) {
    guard let httpRequest = request.request else {
      return
    }

    let url = httpRequest.description
    let method = httpRequest.httpMethod ?? "unknown method"

    os_log("----------WillSend----------")
    os_log("--Method: \(method)")
    os_log("--URL: \(url)")
    os_log("--API: \(String(describing: target.self))")

    if let headers = httpRequest.allHTTPHeaderFields, !headers.isEmpty {
      os_log("--Header: \(headers)")
    }

    if let body = httpRequest.httpBody,
       let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
      os_log("--body: \(bodyString)")
    }
    os_log("----------WillSendEnd-------")
    os_log("\n\n")
  }

  func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
    os_log("----------DidReceive-------")
    switch result {
    case let .success(response):
      self.onSuccess(response, target: target)
    case let .failure(error):
      self.onFail(error, target: target)
    }
    os_log("----------DidReceiveEnd----")
  }

  func onSuccess(_ response: Response, target: TargetType) {
    os_log("--StatusCode: \(response.statusCode)")
    if let responseString = String(
      bytes: response.data,
      encoding: String.Encoding.utf8
    ) {
      os_log("--ResponseString: \(responseString)")
    }
    os_log("--Byte: \(response.data.count)")
  }

  func onFail(_ error: MoyaError, target: TargetType) {
    if let response = error.response {
      self.onSuccess(response, target: target)
      return
    }
    
    os_log("--ErrorCode: \(error.errorCode)")
    os_log("--ErrorCode: \(error.failureReason ?? "unknown error")")
  }
}
