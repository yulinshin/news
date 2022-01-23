//
//  NewListViewModel.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import Foundation
import RxSwift
import RealmSwift
import RxRealm

class NewsListViewModel {

@Inject private var newManager: NewsManager
@Inject private var dbManager: DBManager

    var disposeBag:DisposeBag = .init()
    var news: Results<Article>?
    let realm = try! Realm()
    var didUpdateData: (() -> Void)?

    func getNewsListViewObject(){
        newManager.getNews(country: .us) { result in
            switch result {
            case.success(let response):
                self.dbManager.add(data: response.articles)
                self.observeObjects()
            case.failure(let error):
                print(error)
            }
        }
    }

    init() {
        news = realm.objects(Article.self)
    }

    func observeObjects(){
        Observable.changeset(from: news!)
            .subscribe(onNext: { [weak self] results, changes in
                self?.didUpdateData?()
            })
            .disposed(by: disposeBag)
    }

}

