//
//  EndpointLoader.swift
//  SwiftYouEye
//
//  Created by Widyanti, Retno (AU - Melbourne) on 3/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import Foundation
import Combine

protocol EndpointLoader: ObservableObject {
    associatedtype EndpointType: Endpoint

    var endpoint: EndpointType { get }
    var cancellables: [AnyCancellable] { get set }
    func receive(value: EndpointType.ResultType)
    func load()
}

extension EndpointLoader {
    func load<E: Endpoint>(
        _ endpoint: E,
        _ callback: @escaping (E.ResultType) -> Void) {
        nasa.request(route: endpoint)
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { completion in
                    // Do nothing for now.
                    switch completion {
                    case .failure(_):
                        break
                    case .finished:
                        break
                    }
                },
                receiveValue: { value in
                    callback(value)
                })
            .store(in: &cancellables)
    }

    func load() {
        load(endpoint, self.receive)
    }
}

