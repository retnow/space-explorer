//
//  ContentView.swift
//  SwiftYouEye
//
//  Created by Widyanti, Retno (AU - Melbourne) on 3/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import SwiftUI
import UIKit
import Combine

struct ContentView: View {
    @ObservedObject var loader: APODEndpointLoader
    
    var body: some View {
        Image(uiImage: loader.image ?? UIImage())
            .onAppear(perform: load)
    }


    init(loader: APODEndpointLoader = APODEndpointLoader()) {
        self.loader = loader
    }

    func load() {
        loader.load()
    }

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
