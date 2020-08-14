//
//  GameScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct GameScreen: View {
    @EnvironmentObject var session: SessionStore
    
    @State var moneyPlaceRandomNumber: Int = Int.random(in: 0..<12)
    @State var moneyTypeRandomNumber: Int = Int.random(in: 0..<8)
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
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isShowedEndGameAlert = false
    
    var gameService: GameService = GameService()
    
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
    
    func returnRealPlace(place: Int, money: Int) -> Int {
        let firstPlaceArg = place*3
        let secondPlaceArg = money
        
        return firstPlaceArg+secondPlaceArg
    }
    
    func finishGame() {
        self.time = 10
        self.totalScore = 0
        self.tlScore = 0
        self.dolarScore = 0
        self.euroScore = 0
        self.poundScore = 0
        self.goldScore = 0
        self.bitcoinScore = 0
        self.etheriumScore = 0
        self.dodgeScore = 0
    }
    
    func restartGame() {
        finishGame()
        
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    func saveGame() {
        gameService.saveOnlineGame(userID: self.session.userInfo!.id, score: ScoreModel(score: totalScore, tlScore: tlScore, dolarScore: dolarScore, euroScore: euroScore, poundScore: poundScore, goldScore: goldScore, bitcoinScore: bitcoinScore, etheriumScore: etheriumScore, dodgeScore: dodgeScore), gameType: self.session.userInfo!.gameType, gameLevel: self.session.userInfo!.gameLevel)
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                Text("Time: " + String(time))
                .font(.system(size: 20.0))
                .fontWeight(Font.Weight.medium)
                .onReceive(timer) { time in
                    if self.time > 0 {
                        self.time -= 1
                        self.moneyPlaceRandomNumber = Int.random(in: 0..<7)
                        self.moneyTypeRandomNumber = Int.random(in: 0..<7)
                    } else {
                        self.timer.upstream.connect().cancel()
                        self.isShowedEndGameAlert = true
                        self.saveGame()
                    }
                }
                    

                Text("Score: " + String(totalScore))

                VStack {
                    ForEach(0..<4) {place in
                        HStack {
                            ForEach(0..<3) {money in
                                MoneyButton(moneyName: self.moneys[self.moneyTypeRandomNumber], increaseScore: self.increaseScore, place: self.returnRealPlace(place: place, money: money), randomPlace: self.moneyPlaceRandomNumber)
                            }
                        }
                    }

                }
                .alert(isPresented: $isShowedEndGameAlert) {
                    return Alert(title: Text("Game over!"), message: Text("The game is over. You have caught \(totalScore) coins in total and \(tlScore) Turkish Lira, \(dolarScore) Dolar, \(euroScore) Euro, \(poundScore) Pound, \(goldScore) Gold, \(bitcoinScore) Bitcoin, \(etheriumScore) Etherium, \(dodgeScore) Dodge."), primaryButton: Alert.Button.default(Text("Restart"), action: {
                        self.restartGame()
                        }), secondaryButton: Alert.Button.cancel(Text("Finish"), action: {
                            self.finishGame()
                        }))
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .padding(30.0)
            .onAppear() {
                self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
