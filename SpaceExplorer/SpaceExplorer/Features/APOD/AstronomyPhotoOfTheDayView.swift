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

struct AstronomyPhotoOfTheDayView: View {
    @ObservedObject var loader: AstronomyPhotoOfTheDayViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Image(uiImage: loader.image ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Text(loader.pictureOfTheDay?.title ?? "")
                        .font(.title)
                        .padding(EdgeInsets(
                            top: 0,
                            leading: 16,
                            bottom: 0,
                            trailing: 16))
                        .lineLimit(nil)
                    Text(loader.pictureOfTheDay?.explanation ?? "")
                        .font(.body)
                        .padding(EdgeInsets(
                            top: 0,
                            leading: 16,
                            bottom: 0,
                            trailing: 16))
                        .lineLimit(nil)
                }
            }
                .onAppear(perform: load)
                .navigationBarTitle("Photo of the Day")
        }
    }

    init(loader: AstronomyPhotoOfTheDayViewModel = AstronomyPhotoOfTheDayViewModel()) {
        self.loader = loader
    }

    func load() {
        loader.load()
    }
}
