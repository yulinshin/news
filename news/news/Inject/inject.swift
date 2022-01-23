//
//  inject.swift
//  news
//
//  Created by yulin on 2022/1/22.
//

import Foundation

@propertyWrapper
public struct Inject<T> {

    public var wrappedValue: T {
        Resolver.shareInstance.resolve(T.self)
    }

    public init() {}
}
