//
//  MarsRoverName.swift
//  SpaceExplorer
//
//  Created by Retno Widyanti on 14/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import Foundation
import SwiftUI

enum MarsRoverName: String, Identifiable, CaseIterable {
    var id: String { rawValue }
    
    case curiosity = "Curiosity"
    case opportunity = "Opportunity"
    case spirit = "Spirit"
    
    var image: Image {
        switch self {
        case .curiosity:
            return Image(.curiosityRover)
        case .opportunity:
            return Image(.opportunityRover)
        case .spirit:
            return Image(.spiritRover)
        }
    }
}
