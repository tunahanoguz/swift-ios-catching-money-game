//
//  MoneyButton.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct MoneyButton: View {
    var moneyName: String
    var increaseScore: () -> Void
    
    var place: Int
    var randomPlace: Int
    
    var body: some View {
        VStack {
            if place == randomPlace {
                Button(action: increaseScore) {
                    Image(moneyName)
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                Rectangle()
                .fill(Color.white)
                .frame(width: 100.0, height: 100.0)
            }
        }
    }
}

struct MoneyButton_Previews: PreviewProvider {
    static var moneyName: String = "bitcoin"
    static func increaseScore() {
        print("Increase score!")
    }
    
    static var previews: some View {
        MoneyButton(moneyName: moneyName, increaseScore: increaseScore, place: 1, randomPlace: 1)
    }
}
