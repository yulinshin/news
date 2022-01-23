//
//  Resolver.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import Foundation

class Resolver {

    static let shareInstance = Resolver()
    private var factories = [String: Any]()

    func setupFactories() {
        self.factories = [String: Any]()
        self.add(type: NewsManager.self, NewsManager.sharedInstance)
        self.add(type: DBManager.self, DBManager.sharedInstance)
    }

    func add<T>(type: T.Type, _ factory: T) {
        let key = String(describing: T.self)
        factories[key] = factory
    }

    func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: T.self)
        guard let component: T = factories[key] as? T else {
            fatalError("Dependency '\(T.self)' not resolved!")
        }
        return component
    }
}
