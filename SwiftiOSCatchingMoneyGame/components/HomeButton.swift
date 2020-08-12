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

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
