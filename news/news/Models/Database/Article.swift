//
//  Article.swift
//  news
//
//  Created by yulin on 2022/1/24.
//

import Foundation
import RealmSwift

class Article: Object {

    @objc dynamic var publishedAt = ""
    @objc dynamic var title = ""
    @objc dynamic var urlToImage = ""

    override static func primaryKey() -> String? {
        return "publishedAt"
    }

}
