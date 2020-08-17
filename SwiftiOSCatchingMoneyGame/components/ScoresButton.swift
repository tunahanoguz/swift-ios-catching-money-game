//
//  ScoresButton.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 17.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct ScoresButton: View {
    var text: String
    var firstColor: String = "#2af598"
    var secondColor: String = "#009efd"
    
    var body: some View {
        HStack {
            Text(text)
                .fontWeight(Font.Weight.medium)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: firstColor), Color(hex: secondColor)]), startPoint: .leading, endPoint: .trailing))
        .foregroundColor(Color.white)
        .cornerRadius(8.0)
    }
}

struct ScoresButton_Previews: PreviewProvider {
    static var previews: some View {
        ScoresButton(text: "Online Scores")
    }
}
