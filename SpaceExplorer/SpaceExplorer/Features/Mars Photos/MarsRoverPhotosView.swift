//
//  MarsRoverPhotosView.swift
//  SpaceExplorer
//
//  Created by Retno Widyanti on 14/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import SwiftUI

struct MarsRoverPhotosView: View {
    var body: some View {
        NavigationView {
            List(MarsRoverName.allCases) { name in
                Text(name.rawValue)
            }
            .navigationBarTitle("Mars Rover Photos")
        }
    }
}

