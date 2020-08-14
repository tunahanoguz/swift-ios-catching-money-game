//
//  OnlineScoresScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct OnlineScoresScreen: View {
    var gameService: GameService = GameService()
    @State var games: [GameModel] = []
    
    func setGames(innerGames: [GameModel]) {
        games = innerGames
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            ForEach(games) { game in
                ScoreItem(scoreID: game.id, scoreType: game.gameType, totalScore: game.scores.score, date: game.date)
            }
            
            Spacer()
        }
        .padding(.top, 20.0)
        .padding(.horizontal, 30.0)
        .onAppear() {
            self.gameService.getOnlineGames(setGames: self.setGames)
        }
    }
}

struct OnlineScoresScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnlineScoresScreen()
    }
}
