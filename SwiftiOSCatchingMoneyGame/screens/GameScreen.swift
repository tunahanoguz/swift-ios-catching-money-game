//
//  GameScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct GameScreen: View {
    let moneyPlaceRandomNumber: Int = Int.random(in: 0..<7)
    let moneyTypeRandomNumber: Int = Int.random(in: 0..<7)
    var moneys: [String] = ["tl", "dolar", "euro", "pound", "gold", "bitcoin", "etherium", "dodge"]
    
    @State var time: Int = 10
    @State var totalScore = 0
    @State var tlScore = 0
    @State var dolarScore = 0
    @State var euroScore = 0
    @State var poundScore = 0
    @State var goldScore = 0
    @State var bitcoinScore = 0
    @State var etheriumScore = 0
    @State var dodgeScore = 0
    
    func increaseScore() {
        totalScore += 1
        
        if (moneyTypeRandomNumber == 0) {
            tlScore += 1
        } else if (moneyTypeRandomNumber == 1) {
            dolarScore += 1
        } else if (moneyTypeRandomNumber == 2) {
            euroScore += 1
        } else if (moneyTypeRandomNumber == 3) {
            poundScore += 1
        } else if (moneyTypeRandomNumber == 4) {
            goldScore += 1
        } else if (moneyTypeRandomNumber == 5) {
            bitcoinScore += 1
        } else if (moneyTypeRandomNumber == 6) {
            etheriumScore += 1
        } else {
            dodgeScore += 1
        }
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("Time: " + String(time))
                    .font(.system(size: 20.0))
                    .fontWeight(Font.Weight.medium)
                
                Text("Score: " + String(totalScore))
                
                VStack {
                    ForEach(0..<4) {place in
                        HStack {
                            ForEach(0..<3) {money in
                                MoneyButton(moneyName: self.moneys[self.moneyTypeRandomNumber], increaseScore: self.increaseScore, place: place * money, randomPlace: self.moneyPlaceRandomNumber)
                            }
                        }
                    }
                    
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .padding(30.0)
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
