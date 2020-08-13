//
//  HomeLink.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct NewGameLink: View {
    var text: String
    var firstColor: String = "#667eea"
    var secondColor: String = "#764ba2"
    var icon: String
    
    var body: some View {
        NavigationLink(destination: GameScreen()) {
            HStack {
                Text(text)
                .foregroundColor(Color.white)
                .fontWeight(Font.Weight.medium)
                
                Spacer()
                
                Image(systemName: icon)
                    .foregroundColor(Color.white)
            }
            .padding(.vertical, 40.0)
            .padding(.horizontal, 20.0)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: firstColor), Color(hex: secondColor)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(8.0)
    }
}

struct NewGameLink_Previews: PreviewProvider {
    static var previews: some View {
        NewGameLink(text: "New game", icon: "circle")
    }
}
