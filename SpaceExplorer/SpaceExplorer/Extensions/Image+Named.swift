//
//  Image+Names.swift
//  SpaceExplorer
//
//  Created by Retno Widyanti on 14/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import SwiftUI

extension Image {
    enum ImageName: String {
        case curiosityRover = "CuriosityRover"
        case opportunityRover = "OpportunityRover"
        case spiritRover = "SpiritRover"
    }
    
    init(_ name: ImageName) {
        self.init(name.rawValue)
    }
}
