//
//  BaseRestApi.swift
//  Madocon
//
//  Created by Ha Nguyen Thai on 10/21/19.
//  Copyright © 2019 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya

protocol Restable {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { set get }
}

typealias SuccessCompletion = (Bool) -> Void
typealias ResponseCompletion = (Decodable?) -> Void

class BaseRestApi: NSObject {
    class func decodingTask<T: Decodable>(with data: Data, decodingType: T.Type, _ completion: @escaping ResponseCompletion) {
        do {
            let genericModel = try JSONDecoder().decode(decodingType, from: data)
            completion(genericModel)
        } catch {
            completion(nil)
        }
    }
}

@propertyWrapper
struct Default<T: Decodable & DefaultValue>: Decodable {
    var wrappedValue: T

    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.self)) ?? T.defaultValue
    }
}

protocol DefaultValue {
    static var defaultValue: Self { get }
}

extension String: DefaultValue {
    static var defaultValue: String { "" }
}

extension Int: DefaultValue {
    static var defaultValue: Int { 0 }
}

extension Bool: DefaultValue {
    static var defaultValue: Bool { false }
}

extension KeyedDecodingContainer {
    func decode<T>(_ type: Default<T>.Type, forKey key: K) throws -> Default<T> where T: Decodable {
        return (try? decodeIfPresent(type, forKey: key)) ?? Default(wrappedValue: T.defaultValue)
    }
}

extension Array: DefaultValue where Element: DefaultValue {
    static var defaultValue: [Element] { [] }
}

