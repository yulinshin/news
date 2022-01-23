//
//  DBManger.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import Foundation
import RxSwift
import RealmSwift

class DBManager {

    static let sharedInstance = DBManager()

    private let realm = try! Realm()

    private init() {}

    func add(data:[AtricleData] ) {
        data.forEach { atricleData  in
             let object = Article()
             object.title = atricleData.title
             object.urlToImage = atricleData.urlToImage
             object.publishedAt = atricleData.publishedAt
            try! realm.write {
                realm.add(object, update: .modified)
            }
         }
    }

}
