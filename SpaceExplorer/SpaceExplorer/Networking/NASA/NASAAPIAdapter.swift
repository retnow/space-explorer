//
//  NASAAPIAdapter.swift
//  SwiftYouEye
//
//  Created by Widyanti, Retno (AU - Melbourne) on 3/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import Foundation
import CommonCrypto
import Combine

class NASAAPIAdapter: DataAdapter {
    static let `default`: DataAdapter = {
        return NASAAPIAdapter(
            key: "mbfGu02IjvlG2P0CZiH29jZzrmNL3RxicyZ4XXBN",
            cache: false)
    }()

    let key: String
    let decoder: JSONDecoder

    init(key: String, cache: Bool) {
        self.key = key
        self.useCache = cache
        self.decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
    }

    let useCache: Bool
    private var cache: [URL: Data] = [:]

    private func prepare<T: Endpoint>(route: T) -> URL? {
        guard let routeURL = route.url(key) else {
            return nil
        }

        return URL(string: NASA.API.baseURL + routeURL)
    }

    func request<T: Endpoint>(
        endpoint: T) -> AnyPublisher<T.ResultType, NASA.Errors> {
        guard let url = prepare(route: endpoint) else {
            print("Error preparing route URL.")
            return AnyPublisher(Empty())
        }

        if let cached = cache[url], let decoded = try? self.decoder.decode(
            T.ResultType.self,
            from: cached) {
            return AnyPublisher(Just(decoded)
                .mapError({ _ in NASA.Errors.other }))
        }

        return AnyPublisher(
            URLSession.shared.dataTaskPublisher(for: url)
                .tryCompactMap {
                    let decoded = try self.decoder.decode(
                        T.ResultType.self,
                        from: $0.data)
                    if self.useCache && endpoint.cache {
                        // Only cache if we parsed the data.
                        self.cache[url] = $0.data
                    }
                    return decoded
                }
                .mapError({ error in
                    switch error {
                    case let urlError as URLError:
                        return NASA.Errors.network(urlError)
                    default:
                        return NASA.Errors.encoding(error)
                    }
                }))
    }
}
