//
//  MoyaProvider.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import Moya

extension MoyaProvider {

    func requestObject<Object>(_ target: Target, type: Object.Type, completion: @escaping (Result<Object, Error>) -> Void) where Object: Decodable {
        request(target) { result in
            switch result {
            case let .success(response):
                completion(.success(try! JSONDecoder().decode(type.self, from: response.data)))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
