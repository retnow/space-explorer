//
//  APODEndpoint.swift
//  SwiftYouEye
//
//  Created by Widyanti, Retno (AU - Melbourne) on 3/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

class APODEndpointLoader: EndpointLoader {
    typealias EndpointType = NASA.API.APOD
    typealias Model = AstronomyPictureOfTheDay

    var endpoint: EndpointType
    var cancellables: [AnyCancellable] = []
    @Published var pictureOfTheDay: AstronomyPictureOfTheDay?
    @Published var image: UIImage?

    init() {
        self.endpoint = EndpointType()
        load()
    }

    func receive(value: EndpointType.ResultType) {
        self.pictureOfTheDay = value
        self.downloadImage(from: value.url)
    }

    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }
    }

    // TODO: Move into a common function.
    private func getData(
        from url: URL,
        completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(
            with: url,
            completionHandler: completion).resume()
    }
}

