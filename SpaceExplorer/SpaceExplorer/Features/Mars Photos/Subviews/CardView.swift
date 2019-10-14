//
//  CardView.swift
//  SpaceExplorer
//
//  Created by Retno Widyanti on 14/10/19.
//  Copyright © 2019 Retno Widyanti. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var title: String
    var backgroundImage: Image
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                }
                .lineLimit(3)
                Spacer()
            }
        }
        .padding()
        .frame(height: 250)
        .background(
            backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .cornerRadius(20)
        .animation(.default)
    }
}
