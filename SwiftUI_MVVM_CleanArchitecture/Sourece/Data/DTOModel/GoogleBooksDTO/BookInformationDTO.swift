//
//  BookInformationDTO.swift
//  iOS-malrangBookFinder
//
//  Created by 김동욱 on 2022/10/12.
//

import Foundation

struct BookInformationDTO: Decodable {
  let kind: String?
  let id: String?
  let selfLink: String?
  let etag: String?
  let volumeInfo: ProductDTO?
  let layerInfo: LayerInfoDTO?
  let saleInfo: SaleInformationDTO?
  let accessInfo: AccessInformationDTO?
}

extension BookInformationDTO {
  func toDomain() -> BookInformation {
    return BookInformation(
      id: self.id ?? UUID().uuidString,
      volumeInfo: self.volumeInfo.map { $0.toDomain() }
      ?? Product(
        title: "",
        authors: [],
        publisher: "",
        publishedDate: "",
        description: "",
        pageCount: 0,
        categories: [],
        imageLinks: ImageLinks(thumbnail: "", small: "")
      )
    )
  }
}
