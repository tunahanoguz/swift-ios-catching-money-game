//
//  RatingDetailScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 15.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct RatingDetailScreen: View {
    var gameService: GameService = GameService()
    var scoreID: String
    
    @State var game: GameModel = GameModel()
    
    func setGame(fetchedGame: GameModel) {
        game = fetchedGame
    }
    
    func trimGameType() -> String {
        if game.gameType! == 0 {
          return "Online"
        } else {
          return "Offline"
        }
    }
    
    func trimGameLevel() -> String {
        let scoreLevel = game.gameLevel!
        
        if (scoreLevel == 0) {
          return "Very Easy";
        } else if (scoreLevel == 1) {
          return "Easy";
        } else if (scoreLevel == 2) {
          return "Medium";
        } else if (scoreLevel == 3) {
          return "Hard";
        } else {
          return "Very Hard";
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ScoreDetailItem(scoreTitle: "Game Date", scoreDescription: game.date!)
                    
                    ScoreDetailItem(scoreTitle: "Game Type", scoreDescription: trimGameType())
                    
                    ScoreDetailItem(scoreTitle: "Game Level", scoreDescription: trimGameLevel())
                    
                    ScoreDetailItem(scoreTitle: "Total Score", scoreDescription: String(game.scores!.score))
                    
                    ScoreDetailItem(scoreTitle: "TL Score", scoreDescription: String(game.scores!.tlScore))
                    
                    ScoreDetailItem(scoreTitle: "Dolar Score", scoreDescription: String(game.scores!.dolarScore))
                }
                
                VStack {
                    ScoreDetailItem(scoreTitle: "Euro Score", scoreDescription: String(game.scores!.euroScore))
                    
                    ScoreDetailItem(scoreTitle: "Pound Score", scoreDescription: String(game.scores!.poundScore))
                    
                    ScoreDetailItem(scoreTitle: "Gold Score", scoreDescription: String(game.scores!.goldScore))
                    
                    ScoreDetailItem(scoreTitle: "Bitcoin Score", scoreDescription: String(game.scores!.bitcoinScore))
                    
                    ScoreDetailItem(scoreTitle: "Etherium Score", scoreDescription: String(game.scores!.etheriumScore))
                    
                    ScoreDetailItem(scoreTitle: "Dodge Score", scoreDescription: String(game.scores!.dodgeScore))
                }
            }
            .navigationBarTitle("Rating Detail")
            .navigationBarHidden(false)
        }
    }
}

struct RatingDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        RatingDetailScreen(scoreID: "aSis6aBxW3Kd8nCdYSzo")
    }
}
