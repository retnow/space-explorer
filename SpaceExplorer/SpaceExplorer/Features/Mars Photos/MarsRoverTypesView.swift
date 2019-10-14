//
//  MarsRoverTypesView.swift
//  SpaceExplorer
//
//  Created by Retno Widyanti on 14/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import SwiftUI

struct MarsRoverTypesView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List(MarsRoverName.allCases) { type in
                CardView(
                    title: type.rawValue,
                    backgroundImage: type.image)
                
            }
            .navigationBarTitle("Mars Rover Photos")
        }
    }
}
