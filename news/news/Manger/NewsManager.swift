//
//  APIManger.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import Moya

class NewsManager {

    static let sharedInstance:NewsManager = .init()
    let moyaProvider = MoyaProvider<TopHeadlinesAPI>()

    func getNews(country: TopHeadlinesAPI, completion: @escaping (Result<NewListResponse, Error>) -> Void) {
        moyaProvider.requestObject(country, type: NewListResponse.self) { result in
            switch result {
            case let .success(response):
                completion(.success(response))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

}


