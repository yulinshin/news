//
//  Models.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import Foundation
struct NewListResponse: Codable {
    let articles: [AtricleData]
}

struct AtricleData: Codable {
    let title: String
    let urlToImage: String
    let publishedAt: String
}
