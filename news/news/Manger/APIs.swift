//
//  APIs.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import Moya
import struct Alamofire.HTTPHeaders

protocol NewsAPIProtocol: TargetType {
    var basePath: String { get }
    var additionalPath: String { get }
    var httpHeaders: HTTPHeaders { get }
    var apiVersion: String { get }
}

extension NewsAPIProtocol {

    var baseURL: URL {
        return URL(string: "https://newsapi.org\(apiVersion)")!
    }

    var path: String {
        return "\(basePath)\(additionalPath)"
    }

    var headers: [String : String]? {
        return httpHeaders.dictionary
    }

    var sampleData: Data {
        return Data()
    }
}

// MARK: - MarketingHotsAPI
enum TopHeadlinesAPI: NewsAPIProtocol {
    case us

    var basePath: String {
        return "/top-headlines"
    }

    var additionalPath: String {
        switch self {
        case .us:
            return ""

        }
    }

    var apiVersion: String {
        switch self {
        case .us:
            return "/v2"
        }
    }

    var method: Method {
        switch self {
        case .us:
            return .get
        }
    }

    var httpHeaders: HTTPHeaders {
        switch self {
        case .us:
            return []
        }
    }

    var task: Task {
        switch self {
        case .us:
            return .requestParameters(parameters: ["country":"us","apiKey":"d5eb43247b784855a462c28e4202da23"], encoding: URLEncoding.default)
        }
    }
}
