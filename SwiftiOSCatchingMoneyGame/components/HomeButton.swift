//
//  HomeButton.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct HomeButton: View {
    var text: String
    var buttonFunc: () -> Void
    
    var firstColor: String = "#FF0000"
    var secondColor: String = "#FFA500"
    
    var icon: String
    
    var body: some View {
            Button(action: buttonFunc) {
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

struct HomeButton_Previews: PreviewProvider {
    static func buttonFunc() {
        print("Print something.")
    }
    
    static var previews: some View {
        HomeButton(text: "Show scores", buttonFunc: buttonFunc, icon: "love")
    }
}
