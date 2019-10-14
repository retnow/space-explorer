//
//  Color+Theme.swift
//  SpaceExplorer
//
//  Created by Retno Widyanti on 14/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import SwiftUI

extension Color {
    enum ColorName: String {
        case accent
        case background
    }
    
    init(_ name: ColorName) {
        self.init(name.rawValue)
    }
}
