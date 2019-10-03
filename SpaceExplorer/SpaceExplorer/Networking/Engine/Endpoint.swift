//
//  Endpoint.swift
//  SwiftYouEye
//
//  Created by Widyanti, Retno (AU - Melbourne) on 3/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import Foundation

protocol Endpoint {
    associatedtype ResultType: Codable
    var cache: Bool { get }
    var path: String { get }
    var query: [String: String] { get }
    func url(_ key: String) -> String?
}

extension Endpoint {
    func url(_ key: String) -> String? {
        var components = URLComponents()
        components.path = path
        components.queryItems = query.compactMap {
            return URLQueryItem(name: $0.key, value: $0.value)
        }
        components.queryItems?.append(
            URLQueryItem(name: "api_key", value: "\(key)"))

        return components.string
    }
}
