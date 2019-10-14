//
//  MainTabView.swift
//  SpaceExplorer
//
//  Created by Widyanti, Retno (AU - Melbourne) on 7/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @State var selected = 0

    var body: some View {
        TabView(selection: $selected) {
            AstronomyPhotoOfTheDayView()
                .tabItem {
                    Image("Astronaut")
                    Text("APOD")
                }.tag(0)
            MarsRoverTypesView()
                .tabItem {
                    Image("Rocket")
                    Text("Mars")
                }.tag(1)
        }
        .accentColor(Color("accent"))
    }
}
