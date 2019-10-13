//
//  NASA.swift
//  SwiftYouEye
//
//  Created by Widyanti, Retno (AU - Melbourne) on 3/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import Foundation
import SwiftUI
import CommonCrypto
import Combine

/// Load from API or from mock data.
let nasa: NASA = .default

class NASA: ObservableObject {
    static let `default`: NASA = {
        let adapter = NASAAPIAdapter.default
        return NASA(adapter: adapter)
    }()

    let adapter: DataAdapter

    init(adapter: DataAdapter) {
        self.adapter = adapter
    }

    enum Errors: Error {
        case network(URLError)
        case encoding(Error)
        case other
    }

    func request<T: Endpoint>(route: T) -> AnyPublisher<T.ResultType, Errors> {
        return adapter.request(endpoint: route)
    }
}

extension NASA {
    struct API {
        static let baseURL = "https://api.nasa.gov/"

        struct APOD: Endpoint {
            typealias ResultType = AstronomyPictureOfTheDay
            let cache = true
            let path = "planetary/apod"
            let query: [String: String]

            init(date: String? = nil, hd: Bool? = nil) {
                var query = [String: String]()
                if let date = date {
                    query["date"] = date
                }
                if let hd = hd {
                    query["hd"] = "\(hd)"
                }
                self.query = query
            }
        }
    }
}

